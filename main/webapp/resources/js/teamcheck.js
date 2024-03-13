/**
 * 
 */

  document.addEventListener('DOMContentLoaded', function () {
    const myteamLink = document.querySelector('.nav-link[href="/waguwagu/team/team?id=${myteam}"]');
	console.log("바보");
    myteamLink.addEventListener('click', function (event) {
      // 이 부분에서 myteam 값이 비어있는지 확인
      const myteamValue = "${myteam}"; // 여기에 myteam 값을 설정하는 방식에 따라 다르게 가져와야 합니다.

      if (!myteamValue) {
        alert('가입된 구단이 없습니다!');
        event.preventDefault(); // 페이지 이동을 막음
      }
    });
  });
