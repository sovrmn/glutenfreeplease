
const navigation = () => {
  const menuItems = document.querySelectorAll("#menu-item");
  console.log(menuItems);

  menuItems.forEach((menuItem) =>{
    menuItem.addEventListener('click', (event) =>{
    // event.preventDefault() ;
      // console.log(event.currentTarget);
      if (event.currentTarget.classList.contains('active')) {

        console.log("you are already in the right menu element!");
        } else {
          console.log("you are in another menu element!");
          document.querySelector(".active").classList.remove('active');
          event.currentTarget.classList.add('active');
        }
      });
  });
//   $( '.navbar-dark .navbar-nav a' ).on( 'click', function () {

//     $( '.navbar-dark .navbar-nav' ).find( 'li.active' ).removeClass( 'active' );
//     $( this ).parent( 'li' ).addClass( 'active' );
//     console.log(document.querySelector(".active"));
//   });
// };


export {navigation};
