/*
 * Copyright (C) 2016-2024 phantombot.github.io/PhantomBot
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * Betting system, a system used to bet about things to win or lose points in Twitch chat.
 * bettingSystem.js
 *
 */
(function() {
    let bets = {},
        timeout,
        gain = $.getSetIniDbNumber('bettingSettings', 'gain', 40),
        saveBets = $.getSetIniDbBoolean('bettingSettings', 'save', true),
        saveFormat = $.getSetIniDbString('bettingSettings', 'format', 'yyyy.M.dd'),
        warningMessages = $.getSetIniDbBoolean('bettingSettings', 'warningMessages', false),
        saveStateInterval,
        bet = {
            status: false,
            opened: false,
            entries: 0,
            total: 0,
            minimum: 0,
            maximum: 0,
            timer: 0,
            pointsWon: 0,
            startTime: 0,
            title: '',
            winners: '',
            options: {},
            opt: []
        },
        objOBS = [],
        _betLock = new Packages.java.util.concurrent.locks.ReentrantLock();

    /**
     * @function reloadBet
     * @info Used to update the bet settings from the panel.
     */
    function reloadBet() {
        gain = $.getIniDbNumber('bettingSettings', 'gain');
        saveBets = $.getIniDbBoolean('bettingSettings', 'save');
        saveFormat = $.getIniDbString('bettingSettings', 'format');
        warningMessages = $.getIniDbBoolean('bettingSettings', 'warningMessages');
    }

    /**
     * @function open
     * @info Used to open bets.
     *
     * @param {string} sender
     * @param {string} title
     * @param {string} options
     * @param {int} minimum
     * @param {int} maximum
     * @param {int} timer
     */
    function open(sender, title, options, minimum, maximum, timer) {
        if (title === undefined || options === undefined || isNaN(parseInt(minimum)) || isNaN(parseInt(maximum))) {
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.open.usage'));
            return;
        }
        if (bet.status === true && bet.opened === false) {
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.open.error'));
            return;
        }
        if (bet.status === true) {
            if (sender == $.botName) return;
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.open.error.opened'));
            return;
        }
        options = $.jsString(options);
        if (!options.includes(',')) {
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.open.error.options'));
            return;
        }

        objOBS = [];

        // Remove the old files.
        $.inidb.RemoveFile('bettingPanel');
        $.inidb.RemoveFile('bettingVotes');

        bet.title = title;
        bet.minimum = parseInt(minimum);
        bet.maximum = parseInt(maximum);
        bet.status = true;
        bet.opened = true;
        bet.startTime = $.systemTime();

        if (timer !== undefined && !isNaN(parseInt(timer)) && timer > 0) {
            bet.timer = timer;
            timeout = setTimeout(function() {
                stop();
            }, timer * 6e4);
        }

        saveStateInterval = setInterval(function() {
            saveState();
        }, 5 * 6e4);

        // Trim first spaces.
        let split = options.trim().split(',');

        for (var i = 0; i < split.length; i++) {
            // Trim other spaces.
            split[i] = split[i].trim();
            let loption = split[i].toLowerCase();
            bet.options[loption] = {
                label: split[i],
                bets: 0,
                total: 0
            };
            objOBS.push({
                'label': split[i],
                'votes': 0
            });
            bet.opt.push(split[i]);
            $.inidb.set('bettingVotes', loption.replace(/\s/, '%space_option%'), 0);
        }

        let msg = JSON.stringify({
            'start_bet': 'true',
            'title': title,
            'options': objOBS
        });
        $.alertspollssocket.sendJSONToAll(msg);

        $.say($.lang.get('bettingsystem.open.success', title, split.join(', ')));
        $.inidb.set('bettingPanel', 'title', title);
        $.inidb.set('bettingPanel', 'options', split.join('%space_option%'));
        $.inidb.set('bettingPanel', 'isActive', 'true');
        saveState();
    }

    function reopen() {
        if (!$.inidb.FileExists('bettingState')) {
            return;
        }

        let tempBet = $.getIniDbString('bettingState', 'bet'),
                tempBets = $.getIniDbString('bettingState', 'bets'),
                tempObjOBS = $.getIniDbString('bettingState', 'objOBS');

        if (tempBet === null || tempBets === null || tempObjOBS === null) {
            return;
        }

        bets = JSON.parse(tempBets);
        bet = JSON.parse(tempBet);
        objOBS = JSON.parse(tempObjOBS);

        if (bet.status === true) {
            if (bet.timer > 0) {
                let timeleft = bet.timer - (($.systemTime() - bet.startTime) / 6e4);
                timeout = setTimeout(function() {
                    stop();
                }, timeleft * 6e4);
            }

            saveStateInterval = setInterval(function() {
                saveState();
            }, 5 * 6e4);

            let msg = JSON.stringify({
                'start_bet': 'true',
                'title': bet.title,
                'options': objOBS
            });
            $.alertspollssocket.sendJSONToAll(msg);
        }
    }

    function saveState() {
        _betLock.lock();
        try {
            $.inidb.set('bettingState', 'bets', JSON.stringify(bets));
            $.inidb.set('bettingState', 'bet', JSON.stringify(bet));
            $.inidb.set('bettingState', 'objOBS', JSON.stringify(objOBS));
        } finally {
            _betLock.unlock();
        }
    }

    /**
     * @function close
     * @info Used to close bets.
     *
     * @param {string} sender.
     * @param {string} winning option.
     */
    function close(sender, option) {
        if (option === undefined && bet.opened === true) {
            bet.opened = false;
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.close.error.usage'));
            return;
        }
        if (option === undefined) {
            if (sender == $.botName) return;
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.close.usage'));
            return;
        }
        let loption = option.toLowerCase();
        if (bet.options[loption] === undefined) {
            $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.bet.null'));
            return;
        }

        clearTimeout(timeout);
        clearInterval(saveStateInterval);

        $.inidb.set('bettingPanel', 'isActive', 'false');

        bet.status = false;
        bet.opened = false;

        option = bet.options[loption].label;

        let winners = [],
            total = 0,
            give = 0,
            i;

        $.say($.lang.get('bettingsystem.close.success', option));
        let msg = JSON.stringify({
            'end_bet': 'true'
        });
        $.alertspollssocket.sendJSONToAll(msg);

        for (i in bets) {
            if ($.equalsIgnoreCase(bets[i].option, option)) {
                winners.push(i.toLowerCase());
                give = (((bet.total / bet.options[loption].bets) * parseFloat(gain / 100)) + parseInt(bets[i].amount));
                total += give;
                $.inidb.incr('points', i.toLowerCase(), Math.floor(give));
            }
        }

        bet.winners = winners.join(', ');
        bet.pointsWon = total;

        $.say($.lang.get('bettingsystem.close.success.winners', winners.length, $.getPointsString(Math.floor(total)), option));
        $.inidb.set('bettingSettings', 'lastBet', winners.length + '___' + $.getPointsString(Math.floor(total)));
        save();
        clear();
    }

    /**
     * @function stop
     * @info Used to stop entries in the bet.
     *
     */
    function stop() {
        bet.opened = false;
        $.say($.lang.get('bettingsystem.close.semi.success'));
    }

    /**
     * @function save
     * @info Used to save old bet results if the user wants too.
     *
     */
    function save() {
        if (saveBets) {
            let date = Packages.java.time.ZonedDateTime.now().format(Packages.java.time.format.DateTimeFormatter.ofPattern(saveFormat));

            if (!$.inidb.exists('bettingResults', date)) {
                $.inidb.set('bettingResults', date, $.lang.get('bettingsystem.save.format', bet.title, bet.opt.join(', '), bet.total, bet.entries, bet.pointsWon));
            } else {
                let keys = $.inidb.GetKeyList('bettingResults', ''),
                    a = 1,
                    i;
                for (i in keys) {
                    if (keys[i].includes(date)) {
                        a++;
                    }
                }

                $.inidb.set('bettingResults', (date + '_' + a), $.lang.get('bettingsystem.save.format', bet.title, bet.opt.join(', '), bet.total, bet.entries, bet.pointsWon));
            }
        }
    }

    /**
     * @function clear
     * @info Used to clear the bet results after a bet.
     *
     */
    function clear() {
        clearTimeout(timeout);
        clearInterval(saveStateInterval);
        bets = {};
        bet = {
            status: false,
            opened: false,
            entries: 0,
            total: 0,
            minimum: 0,
            maximum: 0,
            timer: 0,
            pointsWon: 0,
            startTime: 0,
            title: '',
            winners: '',
            options: {},
            opt: []
        };
        objOBS = {};
        $.inidb.set('bettingPanel', 'isActive', 'false');
        saveState();
    }

    /*
     * @function reset
     * @info Resets the bet and gives points back.
     *
     * @param refund, if everyones points should be given back.
     */
    function reset(refund) {
        if (refund) {
            let betters = Object.keys(bets);

            for (var i = 0; i < betters.length; i++) {
                $.inidb.incr('points', betters[i], bets[betters[i]].amount);
            }

        }

        clear();
    }

    /**
     * @function message
     * @info used to send messages
     *
     * @param {string} sender
     * @param {string} msg
     */
    function message(sender, msg) {
        if (warningMessages) {
            $.say($.whisperPrefix(sender) + msg);
        }
    }

    /**
     * @function bet
     * @info Used to place a bet on a option.
     *
     * @param {string} sender
     * @param {int} amount
     * @param {string} option
     */
    function vote(sender, amount, option) {
        if (bet.status === false || bet.opened === false) {
            // $.say($.whisperPrefix(sender) + 'There\'s no bet opened.');
            return;
        }
        if (amount < 1) {
            message(sender, $.lang.get('bettingsystem.bet.error.neg', $.pointNameMultiple));
            return;
        }
        if (bet.minimum > amount) {
            message(sender, $.lang.get('bettingsystem.bet.error.min', bet.minimum));
            return;
        }
        if (bet.maximum < amount && bet.maximum !== 0) {
            message(sender, $.lang.get('bettingsystem.bet.error.max', bet.maximum));
            return;
        }
        if ($.getUserPoints(sender) < amount) {
            message(sender, $.lang.get('bettingsystem.bet.error.points', $.pointNameMultiple));
            return;
        }
        if (bets[sender] !== undefined) {
            message(sender, $.lang.get('bettingsystem.bet.betplaced', $.getPointsString(bets[sender].amount), bets[sender].option));
            return;
        }
        let loption = option.toLowerCase();
        if (bet.options[loption] === undefined) {
            message(sender, $.lang.get('bettingsystem.bet.null'));
            return;
        }

        _betLock.lock();
        try {
            bet.entries++;
            bet.total += parseInt(amount);
            bet.options[loption].bets++;
            bet.options[loption].total += parseInt(amount);
            bets[sender] = {
                option: option,
                amount: amount
            };
            for (var i = 0; i < objOBS.length; i++) {
                if ($.equalsIgnoreCase(objOBS[i].label, option)) {
                    objOBS[i].votes = objOBS[i].votes + amount;
                }
            }
        } finally {
            _betLock.unlock();
        }

        let msg = JSON.stringify({
            'new_bet': 'true',
            'title': bet.title,
            'options': objOBS
        });
        $.alertspollssocket.sendJSONToAll(msg);

        $.inidb.decr('points', sender, amount);
        $.inidb.incr('bettingVotes', loption.replace(/\s/, '%space_option%'), 1);
    }

    /**
     * @event command
     * @info Used for commands.
     *
     * @param {object} event
     */
    $.bind('command', function(event) {
        let sender = event.getSender(),
            command = event.getCommand(),
            args = event.getArgs(),
            action = args[0],
            subAction = args[1];

        if ($.equalsIgnoreCase(command, 'bet')) {
            if (action === undefined) {
                $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.global.usage'));
                return;
            }

            /**
             * @commandpath bet open ["title"] ["option1, option2, option3"] [minimum bet] [maximum bet] [close timer] - Opens a bet with those options.
             */
            if ($.equalsIgnoreCase(action, 'open')) {
                open(sender, args[1], args[2], args[3], args[4], args[5]);
                return;
            }

            /**
             * @commandpath bet close ["winning option"] - Closes the current bet.
             */
            if ($.equalsIgnoreCase(action, 'close')) {
                close(sender, (args[1] === undefined ? undefined : args.slice(1).join(' ').trim()));
                return;
            }

            /**
             * @commandpath bet reset - Resets the current bet.
             */
            if ($.equalsIgnoreCase(action, 'reset')) {
                reset(subAction !== undefined && $.equalsIgnoreCase(subAction, '-refund'));
                return;
            }

            /**
             * @commandpath bet save - Toggle if bet results get saved or not after closing one.
             */
            if ($.equalsIgnoreCase(action, 'save')) {
                saveBets = !saveBets;
                $.inidb.set('bettingSettings', 'save', saveBets);
                $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.toggle.save', (saveBets === true ? $.lang.get('bettingsystem.now') : $.lang.get('bettingsystem.not'))));
                return;
            }

            /**
             * @commandpath bet togglemessages - Toggles bet warning messages on or off.
             */
            if ($.equalsIgnoreCase(action, 'togglemessages')) {
                warningMessages = !warningMessages;
                $.inidb.set('bettingSettings', 'warningMessages', warningMessages);
                $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.warning.messages', (warningMessages === true ? $.lang.get('bettingsystem.now') : $.lang.get('bettingsystem.not'))));
                return;
            }

            /**
             * @commandpath bet saveformat [date format] - Changes the date format past bets are saved in default is yyyy.mm.dd
             */
            if ($.equalsIgnoreCase(action, 'saveformat')) {
                if (subAction === undefined) {
                    $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.saveformat.usage'));
                    return;
                }

                saveFormat = subAction;
                $.inidb.set('bettingSettings', 'format', saveFormat);
                $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.saveformat.set', saveFormat));
                return;
            }

            /**
             * @commandpath bet gain [percent] - Changes the point gain percent users get when they win a bet.
             */
            if ($.equalsIgnoreCase(action, 'gain')) {
                if (subAction === undefined) {
                    $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.gain.usage'));
                    return;
                }

                gain = subAction;
                $.inidb.set('bettingSettings', 'gain', gain);
                $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.gain.set', gain));
                return;
            }

            /**
             * @commandpath bet lookup [date] - Displays the results of a bet made on that day. If you made multiple bets you will have to add "_#" to specify the bet.
             */
            if ($.equalsIgnoreCase(action, 'lookup')) {
                if (subAction === undefined) {
                    $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.lookup.usage', saveFormat));
                    return;
                }
                if (saveBets) {
                    let res = $.optIniDbString('bettingResults', subAction);
                    if (res.isPresent()) {
                        $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.lookup.show', subAction, res.get()));
                    } else {
                        $.say($.whisperPrefix(sender) + $.lang.get('bettingsystem.lookup.null'));
                    }
                }
                return;
            }

            /**
             * @commandpath bet current - Shows current bet stats.
             */
            if ($.equalsIgnoreCase(action, 'current')) {
                if (bet.status === true) {
                    $.say($.lang.get('bettingsystem.results', bet.title, bet.opt.join(', '), bet.total, bet.entries));
                }
                return;

                /**
                 * @commandpath bet [amount] [option] - Bets on that option.
                 */
            } else {
                let option = args.splice(1).join(' ').trim();
                if (option.length === 0) {
                    message(sender, $.lang.get('bettingsystem.bet.usage'));
                    return;
                }

                let points;
                if ($.equalsIgnoreCase(action, "all") || $.equalsIgnoreCase(action, "allin") || $.equalsIgnoreCase(action, "all-in")){
                    points = $.getUserPoints(sender);
                } else if ($.equalsIgnoreCase(action, "half")){
                    points = Math.floor($.getUserPoints(sender)/2);
                } else if (isNaN(parseInt(action))) {
                    message(sender, $.lang.get('bettingsystem.bet.usage'));
                    return;
                } else {
                    points = parseInt(action);
                }

                vote(sender, points, option);
                return;
            }
        }
    });

    /**
     * @event initReady
     */
    $.bind('initReady', function() {
        $.registerChatCommand('./systems/bettingSystem.js', 'bet', $.PERMISSION.Viewer);
        $.registerChatSubcommand('bet', 'current', $.PERMISSION.Viewer);
        $.registerChatSubcommand('bet', 'results', $.PERMISSION.Viewer);
        $.registerChatSubcommand('bet', 'open', $.PERMISSION.Mod);
        $.registerChatSubcommand('bet', 'close', $.PERMISSION.Mod);
        $.registerChatSubcommand('bet', 'reset', $.PERMISSION.Mod);
        $.registerChatSubcommand('bet', 'save', $.PERMISSION.Admin);
        $.registerChatSubcommand('bet', 'saveformat', $.PERMISSION.Admin);
        $.registerChatSubcommand('bet', 'gain', $.PERMISSION.Admin);

        reopen();
    });

    /**
     * @event Shutdown
     */
    $.bind('Shutdown', function() {
        saveState();
    });

    /* export to the $ api */
    $.reloadBet = reloadBet;
})();
