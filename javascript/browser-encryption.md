# Browser encryption

`window.crypto` is the interface. `window.crypto.subtle` returns an implementation.

## Hashing

Supported algorightms:

- SHA-1
- SHA-256
- SHA-384
- SHA-512
  
Sample implementation of hashing:

```javascript
// Returns a Promise which returns an ArrayBuffer
function hash(algo, str) {
    return crypto.subtle.digest(algo, new TextEncoder.encode(str))
}

// ArrayBuffer to hex
function toHex(buff) {
    return []
        .map
        .call(
            new Uint8Array(buff), 
            b => ('00' + b.toString(16)).slice(-2)).join('');
}

// ArrayBuffer to base64
function toBase64 (buff) {
    return btoa(
        new Uint8Array(buff)
                .reduce((s, b) => s + String.fromCharCode(b), ''));
}

hash('SHA-1', 'hello world').then((hashed) => {
    console.log(toHex(hashed));
    console.log(toBase64(hashed));
});
```
