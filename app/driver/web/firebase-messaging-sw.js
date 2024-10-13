importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: 'AIzaSyArkLBTwWhtKSdu-xjRRmnwSQViK-0GN_U',
  appId: '1:307788788371:web:1af9d47bb4fee788469366',
  messagingSenderId: '307788788371',
  projectId: 'yum2go-new',
  authDomain: 'yum2go-new.firebaseapp.com',
  databaseURL: 'https://yum2go-new-default-rtdb.firebaseio.com',
  storageBucket: 'yum2go-new.appspot.com',
  measurementId: 'G-S8T1497SCR',
  easurementId: "G-MJBDSQ17EV"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});
