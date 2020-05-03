let source = $("#search-result-item")[0].innerHTML;
let template = Handlebars.compile(source);

let image, title, author, publisher, description;

$(document).ready(function() {
	makeDiv();
//	insertImg();
	load();
	
    $('#submitForm').on('click', searchFunc);   
    
    $('input[name=keyword]').on('keydown', searchFunc);
    
//    $('.close').on('click', function() {
//    	$.ajax({
//            url: "/books/interestBook",
//            type: 'GET', 
//            success: function(data){
//            	console.log(data);
////            	$('body').html(data);
//            }
//        });
//    });

//	$('div#row').click(
//		function() {
//			var image = $(this).children('div').children('img#image').attr("src");
//			var title = $(this).children('div').children('span#title').text();
//			var author = $(this).children('div').children('span#author').text();
//			var publisher = $(this).children('div').children('span#publisher').text();
//			var description = $(this).children('div#description').text();
//	
//			$.ajax({
//				url : "interestBook",
//				type : 'POST',
//				data : {
//					title : title,
//					author : author,
//					publisher : publisher,
//					description : description,
//					image : image
//				},
//				dataType : "text",
//				success : function(data) {
//					// alert("insert 보냄");
//					$("#myModal .close").click();
//				},
//				error : function(request, status, error) {
//					console.log("code:" + request.status + "\n"
//							+ "message:" + request.responseText
//							+ "\n" + "error:");
//				}
//			});
//		});	
});

function searchFunc(e) {  
	let keyword = $('input[name=keyword]').val();

    let url = "/naver/search?keyword=" + keyword;
    if(e.type == "keydown" && e.keyCode != 13) {
    	return;
    } 
    
    $.ajax({
        url: url,
        type: 'GET', 
        success: function(data){
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
				const id = $('#user-id').val();
				
				$.ajax({
					url: '/books/interestBook',
					type: 'POST',
					data: {
		 				'title': title,
		 				'author': author,
		 				'publisher': publisher,
		 				'image': image,
		 				'description': description,
		 				'interested': true,
		 				'userId': id,
					},
					success: function(response) {
						location.reload();
					},
					error: function(request, status, error) {
						console.log('code: ' + request.status + '\nmessage: ' + request.responseText + '\nerror: ' + error);
					}
				});
			});
        },
        error: function(request, status, error) {
        	console.log('code: ' + request.status + '\nmessage: ' + request.responseText + '\nerror: ' + error);
        }
    });
    
    $('#displayInterestBook > .interestBook').css({
    	'width': '120px',
    	'height': '180px',
    	'border': '1px solid lightgray'
    });
    
    $('#displayInterestBook > .interestBook').hover(function() {
    	$(this).stop().animate({
    		zoom: '1.1'
    	}, 150), function() {
    		$(this).stop().animate({
    			zoom: '1'
    		}, 200);
    	}
    });
    
    $('#displayInterestBook > .interestBook').click(function() {
    	console.log('test');
    	$.ajax({
    		url: '/books/interestBook/detail',
    		type: 'POST',
    		data: {
    			'image:': ''
    		},
    		success: function(response) {
    			console.log(response);
    		},
    		error: function(request, status, error) {
    			console.log('code: ' + request.status + '\nmessage: ' + request.responseText + '\nerror: ' + error);
    		}
    	});
    });
}

function load() {
	jQuery('img.svg').each(function(){
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');

        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');

            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Replace image with new SVG
            $img.replaceWith($svg);

        }, 'xml');

    });
}

function makeDiv() {
	var total = '${total}';
//	console.log('토탈', total);
	if (total % 4 > 0) {
		var rows = parseInt(total / 4) + 1;
	} else {
		var rows = parseInt(total / 4);
	}

	for (var i = 1; i <= rows; i++) {
		$('#displayInterestBook').append(
				"<div class='row justify-content-md-center mb-0' id=row" + i
						+ "></div><div class='line'></div>");
		for (var j = 1; j <= 4; j++) {
			$('#row' + i).append(
					"<div class='col'><div class='center-block' id='col"
							+ (((i - 1) * 4) + j) + "'></div></div>");
		}
	}
};