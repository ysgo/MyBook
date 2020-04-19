function searchMember() {
	window.open("/users/search", "아이디/비밀번호 찾기",
			"width=500, height=620, left=100, top=50");
}

function searchFunc(e) {
	var keyword = $('input[name=keyword]').val();

	var url = "bookList.do?keyword=" + keyword;
	if (e.type == "keydown" && e.keyCode != 13) {
		return;
	}

	$.ajax({
		url : url,
		type : 'GET',
		success : function(data) {
			$('body').html(data);
			$('#myModal').modal('show');
		}
	});
}

$(function() {
	$('#submitForm').on('click', searchFunc);
	$('input[name=keyword]').on('keydown', searchFunc);
	$('.close').on('click', function() {
		$.ajax({
			url : "bookList.do",
			type : 'GET',
			success : function(data) {
				$('body').html(data);
			}
		});
	});
});