let source = $("#search-result-item")[0].innerHTML;
let template = Handlebars.compile(source);

let image, title, author, publisher, description;

$(document).ready(function() {
	$('#submitForm').on('click', searchFunc);
	
	//서평 추가 모달에서 확인버튼 눌렀을 때
	$('button#m_submit').click(function() {
		let m_title = $('input#m_title').val();
		let m_content = $('textarea#m_content').val();
		m_content = m_content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		console.log(m_title);
		console.log(m_content);
		id = $('#user-id').val();
		console.log(id);
		$.ajax({
			url : '/books',
			type : 'POST',
			data : {
				title: title,
				image: image,
				author: author,
				publisher: publisher,
				description: description,
				userId: id
			},
			success : function(response) {
				console.log(response);
				$.ajax({
					url: '/reviews',
					type: 'POST',
					data: {
						title: m_title,
						star: m_star,
						description: m_content,
						bookId: response.id
					},
					success: function(response) {
						console.log(response);
					},
					error : function(request, status, error) {
						console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:");
					}					
				});
				
				$("#myModal2 .close").click();
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:");
			}
		});
//		$.ajax({
//			url : "/books/readBook",
//			type : 'POST',
//			data : {
//				userId : id
//				title : m_title,
//				star : m_star,
//				content : m_content,
//			},
//			dataType : "text",
//			success : function(data) {
//				$("#myModal2 .close").click();
//			},
//			error : function(request, status, error) {
//				console.log("code:" + request.status + "\n"
//						+ "message:" + request.responseText
//						+ "\n" + "error:");
//			}
//		});
	});
	
//서평 모달에서 별점 눌렀을 때 채워지게 함 
	$(".star_rating a").click(function() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		return false;
	});
});



//별값 가져오기
let m_star = 5;
$('a[target]').click(function() {
	m_star = $(this).attr('id');
});


//	<!-- 수정버튼 -->
function updateButton(id, m_title, m_star, m_content) {
	document.getElementById('m_title').value = m_title;
	document.getElementById('m_content').value = m_content.replace(/(<br\/>|(<br><\/button>))/g, '\r\n');
	$('#' + m_star).parent().children("a").removeClass("on");
	$('#' + m_star).addClass("on").prevAll("a").addClass("on");

	m_star = m_star;
	$('a[target]').click(function() {
		m_star = $(this).attr('id');
	});
}
//	<!-- 	수정버튼 끝 -->

function searchFunc(e) {
	let keyword = $('input[name=keyword]').val();
	let url = "/naver/search?keyword=" + keyword;
	if (e.type == "keydown" && e.keyCode != 13) {
		return;
	}

	$.ajax({
		url : url,
		type : 'GET',
		success : function(data) {
			$('#search-result *').remove();
			$('#search-result').append(template({
				'books' : data
			}));

			$('div#row').click(function() {
				image = $(this).children('div').children('img#image').attr("src");
				title = $(this).children('div').children('span#title').text();
				author = $(this).children('div').children('span#author').text();
				publisher = $(this).children('div').children('span#publisher').text();
				description = $(this).children('div#description').text();

				$("#myModal").removeClass("in");
				$(".modal-backdrop").remove();
				$("#myModal").hide();
				$('#myModal2').modal('show');
			});
		}
	});
}

function fn_paging(curPage) {
	location.href = "/books/readBook?curPage=" + curPage;
}
	
function hover(e) {
	let image = e.childNodes[1];
	image.id === 'pencil' ? image.src = 'images/white-pencil.png' : image.src = 'images/white-trash.png';
}

function leave(e) {
	let image = e.childNodes[1];
	image.id === 'pencil' ? image.src = 'images/pencil.png' : image.src = 'images/trash.png';
}
