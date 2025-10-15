
// Wait for <img> tags
function waitForTagImages() {
    const imgs = Array.from(document.images);
    return Promise.all(imgs.map(img =>
        img.complete ? Promise.resolve() :
            new Promise(res => {
                img.addEventListener('load', res, { once: true });
                img.addEventListener('error', res, { once: true }); // don't block forever on errors
            })
    ));
}

// Wait for background-image URLs in computed styles
function waitForBackgroundImages() {
    const urls = new Set();
    Array.from(document.querySelectorAll('*')).forEach(el => {
        const bg = getComputedStyle(el).backgroundImage;
        const match = bg && bg.match(/url\(([^)]+)\)/g);
        if (match) match.forEach(m => urls.add(m.replace(/^url\(["']?/, '').replace(/["']?\)$/, '')));
    });
    const loaders = Array.from(urls).map(src => new Promise(res => {
        const i = new Image();
        i.onload = i.onerror = res;
        i.src = src;
    }));
    return Promise.all(loaders);
}

// Wait for web fonts too
const fontsReady = ('fonts' in document) ? document.fonts.ready : Promise.resolve();

// Window 'load' covers most subresources, but we also explicitly wait for bg images & fonts
const fullReady = Promise.all([
    new Promise(res => window.addEventListener('load', res, { once: true })),
    waitForTagImages(),
    waitForBackgroundImages(),
    fontsReady
]);

fullReady.then(() => {
    // If you initialize AOS or other libs, do it here
    // AOS.init({ once: true });
    const loader = document.getElementById('app-loader');
    if (loader) loader.remove();
    document.documentElement.classList.add('page-loaded');
});
    </script>