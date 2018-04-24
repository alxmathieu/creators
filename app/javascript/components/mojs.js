import 'mo-js';

function getOffset( el ) {
    let _x = 0;
    let _y = 0;
    while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
        _x += el.offsetLeft - el.scrollLeft;
        _y += el.offsetTop - el.scrollTop;
        el = el.offsetParent;
    }
    return { top: _y, left: _x };
}

function showBurst() {

  const allUpvoteBtnsInactive = document.querySelectorAll(".icon-not-upvoted");
  const explo = new mojs.Burst({
    left:0,
    top: 0,
  });
  allUpvoteBtnsInactive.forEach((upvoteBtn) => {
    upvoteBtn.addEventListener( 'click', function (e) {
      explo
        .tune({ x: getOffset(upvoteBtn).left + 0.45 * (upvoteBtn.offsetWidth) , y: getOffset(upvoteBtn).top + + 0.5 * (upvoteBtn.offsetHeight)  })
        .replay();
      });
    });
};

showBurst();

export {showBurst};



