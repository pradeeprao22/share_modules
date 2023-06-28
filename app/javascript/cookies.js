function getCookie(cookieName) {
    let cookie = {};
    console.log(document.cookie)

    document.cookie.split(';').forEach(
      function(el) {

      let [key,value] = el.split('=');
      
      cookie[key.trim()] = value;
    })

    console.log(cookie[cookieName]) 
    return cookie[cookieName];
    
}