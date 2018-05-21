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

function showBurstCard() {

  const allUpvoteBtnsInactive = document.querySelectorAll(".icon-not-upvoted");

  // default style
  // const explo = new mojs.Burst({
  //   left:0,
  //   top: 0,
  //    children: {
  //      fill:       '#fec624',
  //    }
  // });

  //twitter style
  const explo = new mojs.Burst({
    left: 0, top: 0,
    radius:   { 4: 32 },
    angle:    45,
    count:    14,
    children: {
      radius:       2.5,
      fill:         '#fec624',
      scale:        { 1: 0, easing: 'quad.in' },
      pathScale:    [ .8, null ],
      degreeShift:  [ 13, null ],
      duration:     [ 500, 700 ],
      easing:       'quint.out'
    }
  });

  allUpvoteBtnsInactive.forEach((upvoteBtn) => {
    upvoteBtn.addEventListener( 'click', function (e) {
      explo
        .tune({ x: getOffset(upvoteBtn).left + 0.5 * (upvoteBtn.offsetWidth) , y: getOffset(upvoteBtn).top + + 1.5 * (upvoteBtn.offsetHeight)  }) //0.5 for centering it to the button
        .replay();
      });
    });
};

showBurstCard();

export {showBurstCard};

function showBurstCreatorShow() {

  const allUpvoteBtnsInactive = document.querySelectorAll(".waiting");

  // default style
  // const explo = new mojs.Burst({
  //   left:0,
  //   top: 0,
  //    children: {
  //      fill:       '#fec624',
  //    }
  // });

  //twitter style
  const explo = new mojs.Burst({
    left: 0, top: 0,
    radius:   { 4: 32 },
    angle:    45,
    count:    14,
    children: {
      radius:       2.5,
      fill:         '#fec624',
      scale:        { 1: 0, easing: 'quad.in' },
      pathScale:    [ .8, null ],
      degreeShift:  [ 13, null ],
      duration:     [ 500, 700 ],
      easing:       'quint.out'
    }
  });

  allUpvoteBtnsInactive.forEach((upvoteBtn) => {
    upvoteBtn.addEventListener( 'click', function (e) {
      explo
        .tune({ x: getOffset(upvoteBtn).left + 1.18 * (upvoteBtn.offsetWidth) , y: getOffset(upvoteBtn).top +  0.5 * (upvoteBtn.offsetHeight)  }) //0.5 for centering it to the button
        .replay();
      });
    });
};

showBurstCreatorShow();

export {showBurstCreatorShow};



