# DOM Clobbering

Legacy browser feature.

```html
<!DOCTYPE html>
<html>
<body>
    <h1 id="dog">Bow!</h1>
    <script>
        alert(dog)
    <script>
</body>
</html>
```

Instead of requiring `document.getElementById(dog)`, the legacy feature creates a javascript variable with the id and/or name of the element. If you already have this variable, the browser won't overwrite it.



The variable will contain the element that got clobbered. In this case it will be the h1 element. But this can also be useful with `iframe`'s for example.



Sources:

- [The Spanner - DOM Clobbering (2013-05-16)](http://www.thespanner.co.uk/2013/05/16/dom-clobbering/)
- [Google CTF 2019 (Liveoverflow & PwnFunction)](https://www.youtube.com/watch?v=2up8J9dErHI)
