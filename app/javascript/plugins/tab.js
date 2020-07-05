const tab =() =>{
  const navItems = document.querySelectorAll('#menu-item');
  console.log(navItems)
  navItems.forEach((navItem) => {
    if (navItem.classList.contains("active")) {
    // Has my-class in it
    } else {
    // No my-class :(
    navItem.classList.remove("active")
    }
  });

};


export {tab};

