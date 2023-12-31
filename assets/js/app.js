(() => {
  'use strict';
  $(document).ready(function () {
    $('.slider-films__slider').slick({
      slidesToShow: 3,
      responsive: [
        { breakpoint: 1100, settings: { slidesToShow: 2 } },
        { breakpoint: 767, settings: { slidesToShow: 1 } },
      ],
    }),
      $('.events__slider').slick({
        slidesToShow: 3,
        responsive: [
          { breakpoint: 1100, settings: { slidesToShow: 2 } },
          { breakpoint: 767, settings: { slidesToShow: 1 } },
        ],
      }),
      $('.header__burger').click(function (e) {
        $('.header__burger,.header__menu,.header__icons').toggleClass('active'),
          $('body').toggleClass('lock');
      });
  }),
    (function (e) {
      let s = new Image();
      (s.onload = s.onerror =
        function () {
          !(function (e) {
            let s = !0 === e ? 'webp' : 'no-webp';
            document.documentElement.classList.add(s);
          })(2 == s.height);
        }),
        (s.src =
          'data:image/webp;base64,UklGRjoAAABXRUJQVlA4IC4AAACyAgCdASoCAAIALmk0mk0iIiIiIgBoSygABc6WWgAA/veff/0PP8bA//LwYAAA');
    })();
})();
