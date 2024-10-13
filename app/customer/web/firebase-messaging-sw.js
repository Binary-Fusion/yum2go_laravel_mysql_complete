importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyArkLBTwWhtKSdu-xjRRmnwSQViK-0GN_U",
    authDomain: "yum2go-new.firebaseapp.com",
    databaseURL: "https://yum2go-new-default-rtdb.firebaseio.com",
    projectId: "yum2go-new",
    storageBucket: "yum2go-new.appspot.com",
    messagingSenderId: "307788788371",
    appId: "1:307788788371:web:1af9d47bb4fee788469366",
    measurementId: "G-S8T1497SCR"
});

const messaging = firebase.messaging();

messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});