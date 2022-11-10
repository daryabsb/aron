const vetur = require("@volar-plugins/vetur");

module.exports = {
    plugins: [volarPrettierPlugin({
        languages: ['html', 'css', 'scss', 'typescript', 'javascript'],
        html: {
            breakContentsFromTags: true,
        },
        useVscodeIndentation: true,
    }), ],
};