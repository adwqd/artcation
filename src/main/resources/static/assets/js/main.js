/**
* Template Name: Selecao
* Template URL: https://bootstrapmade.com/selecao-bootstrap-template/
* Updated: Aug 07 2024 with Bootstrap v5.3.3
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/

(function() {
  "use strict";

  /**
   * Apply .scrolled class to the body as the page is scrolled down
   */
  function toggleScrolled() {
    const selectBody = document.querySelector('body');
    const selectHeader = document.querySelector('#header');
    if (!selectHeader.classList.contains('scroll-up-sticky') && !selectHeader.classList.contains('sticky-top') && !selectHeader.classList.contains('fixed-top')) return;
    window.scrollY > 100 ? selectBody.classList.add('scrolled') : selectBody.classList.remove('scrolled');
  }

  document.addEventListener('scroll', toggleScrolled);
  window.addEventListener('load', toggleScrolled);

  /**
   * Mobile nav toggle
   */
  const mobileNavToggleBtn = document.querySelector('.mobile-nav-toggle');

  function mobileNavToogle() {
    console.log('모바일 네비게이션 토글 실행');
    const body = document.querySelector('body');
    const navmenu = document.querySelector('.navmenu');
    
    body.classList.toggle('mobile-nav-active');
    
    if (mobileNavToggleBtn) {
      mobileNavToggleBtn.classList.toggle('bi-list');
      mobileNavToggleBtn.classList.toggle('bi-x');
    }
    
    const isActive = body.classList.contains('mobile-nav-active');
    console.log('mobile-nav-active 상태:', isActive);
    console.log('navmenu 요소:', navmenu);
    
    if (navmenu) {
      console.log('navmenu 스타일:', window.getComputedStyle(navmenu).display);
      console.log('navmenu z-index:', window.getComputedStyle(navmenu).zIndex);
      console.log('navmenu position:', window.getComputedStyle(navmenu).position);
      
      // 강제로 스타일 적용
      if (isActive) {
        navmenu.style.position = 'fixed';
        navmenu.style.top = '0';
        navmenu.style.left = '0';
        navmenu.style.width = '100vw';
        navmenu.style.height = '100vh';
        navmenu.style.backgroundColor = 'rgba(33, 37, 41, 0.95)';
        navmenu.style.zIndex = '99999';
        navmenu.style.display = 'block';
        
        const navmenuUl = navmenu.querySelector('ul');
        if (navmenuUl) {
          navmenuUl.style.display = 'block';
          navmenuUl.style.visibility = 'visible';
          navmenuUl.style.opacity = '1';
          navmenuUl.style.position = 'absolute';
          navmenuUl.style.top = '80px';
          navmenuUl.style.left = '20px';
          navmenuUl.style.right = '20px';
          navmenuUl.style.background = 'rgba(255, 255, 255, 0.95)';
          navmenuUl.style.borderRadius = '10px';
          navmenuUl.style.padding = '20px';
          navmenuUl.style.margin = '0';
          navmenuUl.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.3)';
        }
        console.log('모바일 메뉴 열림 - 강제 스타일 적용');
      } else {
        navmenu.style.cssText = '';
        const navmenuUl = navmenu.querySelector('ul');
        if (navmenuUl) {
          navmenuUl.style.cssText = '';
        }
        console.log('모바일 메뉴 닫힘 - 스타일 초기화');
      }
    }
  }
  
  if (mobileNavToggleBtn) {
    console.log('모바일 토글 버튼 찾음:', mobileNavToggleBtn);
    
    // 기존 이벤트 리스너 제거
    mobileNavToggleBtn.replaceWith(mobileNavToggleBtn.cloneNode(true));
    const newMobileNavToggleBtn = document.querySelector('.mobile-nav-toggle');
    
    // 클릭 이벤트만 추가
    newMobileNavToggleBtn.addEventListener('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      console.log('모바일 토글 버튼 클릭됨');
      mobileNavToogle();
    });
    
    // 포커스 가능하도록 설정
    newMobileNavToggleBtn.setAttribute('tabindex', '0');
    newMobileNavToggleBtn.setAttribute('role', 'button');
    newMobileNavToggleBtn.setAttribute('aria-label', '모바일 메뉴 토글');
    
    // 스타일 강제 적용
    newMobileNavToggleBtn.style.cursor = 'pointer';
    newMobileNavToggleBtn.style.userSelect = 'none';
    newMobileNavToggleBtn.style.pointerEvents = 'auto';
  } else {
    console.error('모바일 토글 버튼을 찾을 수 없습니다');
  }

  /**
   * Hide mobile nav on same-page/hash links
   */
  document.querySelectorAll('#navmenu a').forEach(navmenu => {
    navmenu.addEventListener('click', () => {
      if (document.querySelector('.mobile-nav-active')) {
        mobileNavToogle();
      }
    });
  });

  /**
   * Toggle mobile nav dropdowns
   */
  document.querySelectorAll('.navmenu .toggle-dropdown').forEach(navmenu => {
    navmenu.addEventListener('click', function(e) {
      e.preventDefault();
      this.parentNode.classList.toggle('active');
      this.parentNode.nextElementSibling.classList.toggle('dropdown-active');
      e.stopImmediatePropagation();
    });
  });

  /**
   * Preloader
   */
  const preloader = document.querySelector('#preloader');
  if (preloader) {
    window.addEventListener('load', () => {
      preloader.remove();
    });
  }

  /**
   * Scroll top button
   */
  let scrollTop = document.querySelector('.scroll-top');

  function toggleScrollTop() {
    if (scrollTop) {
      window.scrollY > 100 ? scrollTop.classList.add('active') : scrollTop.classList.remove('active');
    }
  }
  
  if (scrollTop) {
    scrollTop.addEventListener('click', (e) => {
      e.preventDefault();
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  }

  window.addEventListener('load', toggleScrollTop);
  document.addEventListener('scroll', toggleScrollTop);

  /**
   * Animation on scroll function and init
   */
  function aosInit() {
    AOS.init({
      duration: 600,
      easing: 'ease-in-out',
      once: true,
      mirror: false
    });
  }
  window.addEventListener('load', aosInit);

  /**
   * Initiate glightbox
   */
  try {
    if (typeof GLightbox !== 'undefined') {
      const glightbox = GLightbox({
        selector: '.glightbox'
      });
    } else {
      console.warn('GLightbox가 로드되지 않았습니다.');
    }
  } catch (error) {
    console.warn('GLightbox 초기화 중 오류 발생:', error);
  }

  /**
   * Init isotope layout and filters
   */
  document.querySelectorAll('.isotope-layout').forEach(function(isotopeItem) {
    let layout = isotopeItem.getAttribute('data-layout') ?? 'masonry';
    let filter = isotopeItem.getAttribute('data-default-filter') ?? '*';
    let sort = isotopeItem.getAttribute('data-sort') ?? 'original-order';

    let initIsotope;
    imagesLoaded(isotopeItem.querySelector('.isotope-container'), function() {
      initIsotope = new Isotope(isotopeItem.querySelector('.isotope-container'), {
        itemSelector: '.isotope-item',
        layoutMode: layout,
        filter: filter,
        sortBy: sort
      });
    });

    isotopeItem.querySelectorAll('.isotope-filters li').forEach(function(filters) {
      filters.addEventListener('click', function() {
        isotopeItem.querySelector('.isotope-filters .filter-active').classList.remove('filter-active');
        this.classList.add('filter-active');
        initIsotope.arrange({
          filter: this.getAttribute('data-filter')
        });
        if (typeof aosInit === 'function') {
          aosInit();
        }
      }, false);
    });

  });

  /**
   * Init swiper sliders
   */
  function initSwiper() {
    document.querySelectorAll(".init-swiper").forEach(function(swiperElement) {
      let config = JSON.parse(
        swiperElement.querySelector(".swiper-config").innerHTML.trim()
      );

      if (swiperElement.classList.contains("swiper-tab")) {
        initSwiperWithCustomPagination(swiperElement, config);
      } else {
        new Swiper(swiperElement, config);
      }
    });
  }

  window.addEventListener("load", initSwiper);

  /**
   * Correct scrolling position upon page load for URLs containing hash links.
   */
  window.addEventListener('load', function(e) {
    if (window.location.hash) {
      if (document.querySelector(window.location.hash)) {
        setTimeout(() => {
          let section = document.querySelector(window.location.hash);
          let scrollMarginTop = getComputedStyle(section).scrollMarginTop;
          window.scrollTo({
            top: section.offsetTop - parseInt(scrollMarginTop),
            behavior: 'smooth'
          });
        }, 100);
      }
    }
  });

  /**
   * Navmenu Scrollspy
   */
  let navmenulinks = document.querySelectorAll('.navmenu a');

  function navmenuScrollspy() {
    navmenulinks.forEach(navmenulink => {
      if (!navmenulink.hash) return;
      let section = document.querySelector(navmenulink.hash);
      if (!section) return;
      let position = window.scrollY + 200;
      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
        document.querySelectorAll('.navmenu a.active').forEach(link => link.classList.remove('active'));
        navmenulink.classList.add('active');
      } else {
        navmenulink.classList.remove('active');
      }
    })
  }
  window.addEventListener('load', navmenuScrollspy);
  document.addEventListener('scroll', navmenuScrollspy);

})();