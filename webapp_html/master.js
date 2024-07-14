function getCurrentTime() {
    const CURRENT_DATE = new Date();
    let datetime = [{}];
    datetime[0] = {
        hour:   ( '00'   + ( CURRENT_DATE.getHours()    ) ).substr(-2),
        minute: ( '00'   + ( CURRENT_DATE.getMinutes()  ) ).substr(-2),
        second: ( '00'   + ( CURRENT_DATE.getSeconds()  ) ).substr(-2),
        month:  ( '00'   + ( CURRENT_DATE.getMonth()+1  ) ).substr(-2),
        date:   ( '00'   + ( CURRENT_DATE.getDate()     ) ).substr(-2),
        year:   ( '0000' + ( CURRENT_DATE.getFullYear() ) ).substr(-2),
    }
    return datetime;
}
async function hash_encode(text='', encode='SHA-256') {
    /**
    * @docs
        https://developer.mozilla.org/en-US/docs/Web/API/SubtleCrypto/digest
    * @args encode::text
        - SHA-1
        - *SHA-256
        - SHA-384
        - SHA-512
    * @args text::text
        .*
    */
    const uint8  = new TextEncoder().encode(text)
    const digest = await crypto.subtle.digest(encode, uint8)
    return Array.from(new Uint8Array(digest)).map(v => v.toString(16).padStart(2,'0')).join('')
}
function insertFavicon() {
    ['icon', 'apple-touch-icon', 'favicon'].forEach((e)=>{
        let favicon = document.createElement('link');
        favicon.rel = `${e}`;
        favicon.href = (location.origin) + '/lib/favicon.webp';
        favicon.type = 'image/webp';
        document.head.appendChild(favicon);
    });
}
function insertLastElement() {
    const domLastElement = document.createElement('div');
    domLastElement.id='lastElement';
    domLastElement.style.height="150px";
    Array.from( document.querySelectorAll( '#' + domLastElement.id ) ).map( (item)=>{
        console.debug(item);
        item.remove();
    } )
    document.body.appendChild(domLastElement);
}
