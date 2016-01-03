/**
 * 
 */

//Get book details.

//Store object
var storeObject = {
        bookId : '',
        viewOrderCursor :'',
}

function loading(showOrHide) {
    setTimeout(function(){
        $.mobile.loading(showOrHide);
    }, 1); 
}

$(document).on("pageinit", "#home", function() {
    $('.my-book-item').click(function() {
        storeObject.bookId = $(this).data('id');
        console.log(storeObject.bookId);
        $.mobile.changePage("#page_book_details");
    });
});


//Update cart
$(document).on("pageinit","#page_book_details", function() {
    $(".add_to_cart").click(function() {
        console.log("hello usp");
        var orderUnits = $("#page_book_details .order_units").val();
        loading('show'); 
        $.post("AddToCart",
                {
            "book_id": storeObject.bookId,
            "order_units" : orderUnits
                },
                function(data) {
                    console.log(data);
                    loading('hide'); 
                    if (data.indexOf("http://") === 0
                            || data.indexOf("https://") === 0
                            || data.indexOf("/") === 0) {
                        $('#page_signin .signin-link').html("<a href='" + data + "' data-ajax='false'> Sign in </a>");
                        $.mobile.changePage('#page_signin');
                    } else {
                        window.history.back();
                    }
                });
    });
});

$(document).on("pagebeforeshow", "#page_book_details", function(event) {
    console.log("pagebeforeshow");
    loading('show'); 
    $.post("ViewCart",
            {"book_id": storeObject.bookId,},
            function(data) {
                console.log(data);
                $.each(data, function( index, value ) {
                    $("#page_book_details .book_id").text("");
                    $("#page_book_details .book_title").html(value.book.title);
                    $("#page_book_details .book_author").html("by " + value.book.author);
                    $("#page_book_details .available_units").html("Available Units : " + value.book.avaibaleUnits);
                    $("#page_book_details .order_units").val(value.units);
                });
                loading('hide'); 
            });
})

$(document).on("pageinit", "#page_view_cart", function() {
    $('#page_view_cart .cart-item').click(function() {
        storeObject.bookId = $(this).data('id');
        console.log(storeObject.bookId);
        $.mobile.changePage("#page_book_details");
    });


    $('#page_view_cart .place_order').click(function() {
        console.log("Place order");
        loading('show'); 
        $.post("PlaceOrder",
                function(data) {
            console.log(data);
            loading('hide'); 
            $.mobile.changePage("#home");
        });

    });
});

$(document).on("pagebeforeshow", "#page_view_cart", function(event) {
    console.log("pagebeforeshow");
    $('#page_view_cart .list_view').empty();
    loading('show'); 
    $.post("ViewCart",
            {"book_id": "",},
            function(data) {
                console.log(data);
                var content = '';

                $.each(data, function( index, value ) {
                    content += "<li class='cart-item' data-id='"+ value.bookKey +"'><a href='#'><h3>" + value.book.title+"</h3>"
                    + "<p id='no-ellipsis'>by " + value.book.author + " (Author).</p>"
                    + "Units Ordered : <div class='ui-input-text ui-body-c ui-corner-all ui-shadow-inset'>"
                    + "<input type='number' name='number' pattern='[0-9]* id='number-pattern' value='"
                    + value.units + "'  /></div></a> </li>";
                });
                $('#page_view_cart .list_view').append(content);
                $('#page_view_cart .list_view').listview('refresh');

                $('#page_view_cart .cart-item').click(function() {
                    storeObject.bookId = $(this).data('id');
                    console.log(storeObject.bookId);
                    $.mobile.changePage("#page_book_details");
                });
                loading('hide');
            });
});


$(document).on("pagebeforeshow", "#page_view_orders", function(event) {
    console.log("pagebeforeshow");
    $('#page_view_orders .list_view').empty();
    storeObject.viewOrderCursor = '';
    populateViewOrders();
});

function populateViewOrders() {
    loading('show'); 
    $(document).off("scrollstop");
    $.post("ViewOrder",
            {"cursor": storeObject.viewOrderCursor,},
            function(data) {
                console.log(data);
                storeObject.viewOrderCursor = data.cursor;
                var content = '';
                $.each(data.data, function( index, value ) {
                    status = '';
                    if (value.approvalStatus == 0) {
                        status = "Pending";
                    } else if (value.approvalStatus == 1) {
                        status = "Approved";
                    }
                    content += "<li><a href='#'><h3>" + value.book.title + "</h3>"
                    + "<p id='no-ellipsis'>by "+  value.book.author + ".</p>"
                    + "<p id='no-ellipsis'>Order date : " + value.date + "</p>"
                    + "<p id='no-ellipsis'>Units ordered : " + value.units + "</p>"
                    + "<h4>Status : " + status +"</h4>"
                    + "</a></li>";
                });
                $('#page_view_orders .list_view').append(content);
                $('#page_view_orders .list_view').listview('refresh');
                loading('hide'); 


//              var items = '',
//              last = 10;
//              cont = last + 5;
//              for (var i = last; i < 50; i++) {
//              items += "<li>" + i + "</li>";
//              }
//              $("#page_view_orders .list_view").append(items).listview("refresh");

                $(document).on("scrollstop", checkScroll);
            });
}



///////********* Admin controls ********////////////

$(document).on("pagebeforeshow", "#page_admin_orders", function(event) {
    console.log("pagebeforeshow");
    $('#page_admin_orders .list_view').empty();
    storeObject.viewOrderCursor = '';
    fetchAllOrders();
});



function fetchAllOrders() {
    loading('show'); 
    $(document).off("scrollstop");
    $.post("AdminViewOrders",
            {"cursor": storeObject.viewOrderCursor,},
            function(data) {
                console.log(data);
                storeObject.viewOrderCursor = data.cursor;
                var content = '';
                $.each(data.orders, function( index, value ) {
                    status = '';
                    if (value.approvalStatus == 0) {
                        status = "Pending";
                    } else if (value.approvalStatus == 1) {
                        status = "Approved";
                    }
                    content += "<li><h3>" + value.book.title + "</h3>"
                    + "<p id='no-ellipsis'>by "+  value.book.author + ".</p>"
                    + "<p id='no-ellipsis'>Order date : " + value.date + "</p>"
                    + "<p id='no-ellipsis'>Units ordered : " + value.units + "</p>"

                    + "<p id='no-ellipsis'>Requester : " + value.requesterEmail + "</p>"
                    + "<h4>Status : " + status +"</h4>"

                    + "<div data-role='controlgroup' data-type='horizontal' class='my-controlgroup'>" 
                    +       "<a href='#' data-role='button' data-icon='arrow-u'>Accept</a>"
                    +       "<a href='#' data-role='button' data-icon='arrow-d'>Reject</a>"
                    + "</div>"
                    + "</li>";
                });
                $('#page_admin_orders .list_view').append(content);
                $('#page_admin_orders .list_view').listview('refresh');
                
            
                $("#page_admin_orders .list_view").trigger('create');
                
                loading('hide'); 
                $(document).on("scrollstop", checkScroll);
            });
}

//////////////////******Scrolling Infinite list*******//////////////////////////

/* check scroll function */
function checkScroll() {
    console.log("checkScroll");
    var activePage = $.mobile.pageContainer.pagecontainer("getActivePage"),
    screenHeight = $.mobile.getScreenHeight(),
    contentHeight = $(".ui-content", activePage).outerHeight(),
    header = $(".ui-header", activePage).outerHeight() - 1,
    scrolled = $(window).scrollTop(),
    footer = $(".ui-footer", activePage).outerHeight() - 1,
    scrollEnd = contentHeight - screenHeight + header + footer;
    if (scrolled >= scrollEnd) {
        console.log("adding...");
        addMore(activePage[0]);
    }
}

/* add more function */
function addMore(page) {
    console.log(page.id);
    if (page.id === 'page_view_orders') {
        console.log("addMore...");
        populateViewOrders();
    }
    if (page.id === 'page_admin_orders') {
        console.log("addMore...");
        fetchAllOrders();
    }
}

/* attach if scrollstop for first time */
$(document).on("scrollstop", checkScroll);

