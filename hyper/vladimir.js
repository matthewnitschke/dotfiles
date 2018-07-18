exports.decorateConfig = (config) => {

    config.cursorColor = `${config.cursorColor || '#5C6370'}`;


    return Object.assign({}, config, {
        showHamburgerMenu: false,
        cursorShape: 'BEAM',

        borderColor: '#333',
        backgroundColor: '#1E2127',
        foregroundColor: '#ECEFF1',

        padding: '12px 14px',

        fontFamily: 'Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

        fontSize: 12,

        colors: {
            black: '#1E2127',
            red: '#E06C75',
            green: '#98C379',
            yellow: '#D19A66',
            blue: '#61AFEF',
            magenta: '#C678DD',
            cyan: '#56B6C2',
            white: '#ABB2BF',
            lightBlack: '#5C6370',
            lightRed: '#E06C75',
            lightGreen: '#98C379',
            lightYellow: '#D19A66',
            lightBlue: '#6A76FB',
            lightMagenta: '#C678DD',
            lightCyan: '#56B6C2',
            lightWhite: '#FFFFFF'
        },

        bell: false,
        cursorColor: '#4b5263',
    });
}