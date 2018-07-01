const blessed = require('blessed');
const { exec } = require('child_process');

// Create a screen object.
var screen = blessed.screen({
    smartCSR: true
});

screen.title = 'my window title';

// Create a box perfectly centered horizontally and vertically.
var downloadsBox = blessed.box({
    label: 'Downloads',
    top: 0,
    left: 1,
    width: '49%',
    height: '100%',
    tags: true,
    padding: {
        top: 0,
        left: 1,
        right: 1,
        bottom: 0
    },
    border: {
        type: 'line'
    },
    style: {
        focus: {
            border: {
                fg: 'blue'
            },
        }
    },
    vi: true,
    scrollable: true,
    keys: true,
    alwaysScroll: true,
    scrollbar: {
        ch: ' ',
        inverse: true
    }
});

var trashBox = blessed.box({
    label: 'Trash',
    top: 0,
    left: '51%',
    width: '50%',
    height: '100%',
    tags: true,
    padding: {
        top: 0,
        left: 1,
        right: 1,
        bottom: 0
    },
    border: {
        type: 'line'
    },
    style: {
        focus: {
            border: {
                fg: 'blue'
            },
        }
    },
    vi: true,
    scrollable: true,
    keys: true,
    alwaysScroll: true,
    scrollbar: {
        ch: ' ',
        inverse: true
    }
})

var focused = 0;
var focusable = [downloadsBox, trashBox]
var clearFolderActions = [
    () => {
        exec('gvfs-trash ~/Downloads/*', refreshDialogs)
    }, () => {
        exec('rm -rf ~/.local/share/Trash/*', refreshDialogs) // "gvfs-trash --empty" wasnt working when run from cron
    }
]

// Append our box to the screen.
screen.append(downloadsBox);
screen.append(trashBox);

// Quit on Escape, q, or Control-C.
screen.key(['escape', 'q', 'C-c'], function (ch, key) {
    return process.exit(0);
});

screen.key('tab', () => {
    focused = ((focused + 1) % focusable.length);
    focusable[focused].focus();
})

screen.key('c', () => {
    clearFolderActions[focused]();
})

// Render the screen.
screen.render();

downloadsBox.focus();


function refreshDialogs(){
    exec('ls ~/Downloads', (err, stdout, stderr) => {
        downloadsBox.content = stdout.trim();
        screen.render();
    })
    
    exec('ls ~/.local/share/Trash/files', (err, stdout, stderr) => {
        trashBox.content = stdout.trim();
        screen.render();
    })
}

refreshDialogs();