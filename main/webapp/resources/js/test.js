/**
 * 
 */
conole.log("아 왜안되는데요");
    var category = document.querySelectorAll('#position');
    for(var index=0; index<city.length; index++){
		var positions = category[index].innerText;
		var position = positions.split(' ')[0];
		console.log(cityname);
	}
    
    var city = document.querySelectorAll('.cityname');
    for(var index=0; index<city.length; index++){
		var citynames =city[index].innerText;
		var cityname = citynames.split(' ')[0];
		console.log(cityname);
		var pcity = city[index].parentNode.parentNode.parentNode.parentNode;
		if(cityname==="경기도") {
			pcity.classList.add('gyeonggi');
		}
		else if(cityname==="서울특별시") {
			pcity.classList.add('seoul');
		}
		else if(cityname==="부산광역시") {
			pcity.classList.add('busan');
		}
		else if(cityname==="대구광역시") {
			pcity.classList.add('daegu');
		}
		else if(cityname==="울산광역시") {
			pcity.classList.add('ulsan');
		}
		else if(cityname==="경상남도") {
			pcity.classList.add('gyeongnam');
		}
		else if(cityname==="경상북도") {
			pcity.classList.add('gyeongbuk');
		}
		else if(cityname==="인천광역시") {
			pcity.classList.add('incheon');
		}
		else if(cityname==="충청남도") {
			pcity.classList.add('chungnam');
		}
		else if(cityname==="충청북도") {
			pcity.classList.add('chungbuk');
		}
		else if(cityname==="강원특별자치도") {
			pcity.classList.add('gangwon');
		}
		else if(cityname==="제주특별자치도") {
			pcity.classList.add('jeju');
		}
		else if(cityname==="광주광역시") {
			pcity.classList.add('gwangju');
		}
		else if(cityname==="대전광역시") {
			pcity.classList.add('daejeon');
		}
		else if(cityname==="타자"){
			pcity.classList.add('dh');
		}
		else if(cityname==="투수"){
			pcity.classList.add('pitcher');
		}
		else if(cityname==="포수"){
			pcity.classList.add('c');
		}
		else if(cityname==="유격수"){
			pcity.classList.add('ss');
		}
		else if(cityname==="좌익수"){
			pcity.classList.add('lf');
		}
		else if(cityname==="우익수"){
			pcity.classList.add('rf');
		}
		else if(cityname==="중견수"){
			pcity.classList.add('cf');
		}
		
	}
	
	
	function clicko(){
		
		var seoul = document.querySelectorAll('.seoul');
		console.log("ㅋㅋ");
		for(var index=0; index<seoul.length; index++){
			
		seoul[index].classList.add('active');
			
		}
	}	
	
	
	