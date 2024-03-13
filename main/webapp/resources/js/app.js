const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];
const weekdays = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

const giveaway = document.querySelector(".giveaway");
const deadline = document.querySelector(".deadline");
const items = document.querySelectorAll("#countdown ul li span");
const dateString = document.querySelector(".date-all").textContent;
try {
  const gameDate = new Date(dateString);
  const milliseconds = gameDate.getTime();
  console.log("밀리초 값:", milliseconds);
} catch (error) {
  console.error("에러 발생:", error);
}
// months are ZERO index based;
// 날짜 정보 가져오기



let tempDate = new Date();
let tempYear = tempDate.getFullYear();
let tempMonth = tempDate.getMonth();
let tempDay = tempDate.getDate();

// let futureDate = new Date(2020, 3, 24, 11, 30, 0);
/*const futureDate = new Date(tempYear, tempMonth, tempDay + 10, 11, 30, 0);*/
const futureDate = new Date(dateString);
const year = futureDate.getFullYear();
let month = futureDate.getMonth(); // 월은 0부터 시작하므로 1을 더합니다.
const day = futureDate.getDate();
const hours = futureDate.getHours();
const minutes = futureDate.getMinutes();
const seconds = futureDate.getSeconds();
//let month = futureDate.getMonth();
// 출력
console.log(`Date: ${year}-${month}-${day}`);
console.log(`Time: ${hours}:${minutes}:${seconds}`);

month = months[month];
const weekday = weekdays[futureDate.getDay()];
const date = futureDate.getDate();
/*giveaway.textContent = `giveaway ends on ${weekday}, ${date} ${month} ${year} ${hours}:${minutes}am`;*/

const futureTime = futureDate.getTime();

function getRemaindingTime() {
  const today = new Date().getTime();  //현재 시간 구하기
  console.log("today",today);

  const t = futureTime - today;
  console.log("뺀거",t);
  // 1s = 1000ms
  // 1m = 60s
  // 1hr = 60m
  // 1d = 24hr
  // values in miliseconds
  const oneDay = 24 * 60 * 60 * 1000;
  const oneHour = 60 * 60 * 1000;
  const oneMinute = 60 * 1000;
  // calculate all values
  let days = t / oneDay;
  days = Math.floor(days);
  let hours = Math.floor((t % oneDay) / oneHour);
  let minutes = Math.floor((t % oneHour) / oneMinute);
  let seconds = Math.floor((t % oneMinute) / 1000);

  // set values array
  const values = [days, hours, minutes, seconds];
  function format(item) {
    if (item < 10) {
      return (item = `0${item}`);
    }
    return item;
  }

  items.forEach(function (item, index) {
    item.innerHTML = format(values[index]);
  });

  if (t < 0) {
    clearInterval(countdown);
    deadline.innerHTML = `<h4 class="expired">sorry, this giveaway has expired!</h4>`;
  }
}
// countdown;
let countdown = setInterval(getRemaindingTime, 1000);   //1초마다 실행
//set initial values
getRemaindingTime();
