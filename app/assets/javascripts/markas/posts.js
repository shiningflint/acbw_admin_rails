"use strict";

function postInit(blockString, contentString, contentInput, newBlockString, newImgString, delBlockString, editBlockString, sendBtnString, postFormString, dateStr, yearStr, monthStr, dayStr) {
  var content = document.getElementById(contentString);
  var input = document.getElementById(contentInput);
  var newBlock = document.getElementById(newBlockString);
  var newImg = document.getElementById(newImgString);
  var delBlock = document.getElementById(delBlockString);
  var editBlock = document.getElementById(editBlockString);
  var postBlocks = document.querySelectorAll(blockString);
  var sendBtn = document.getElementById(sendBtnString);
  var postForm = document.getElementById(postFormString);
  var dateTxt = document.getElementById(dateStr);
  var dateObj = null;
  var postYear = document.getElementById(yearStr);
  var postMonth = document.getElementById(monthStr);
  var postDay = document.getElementById(dayStr);
  var currentBlock = null;

  if (dateTxt.hasAttribute("value")) {
    dateObj = new Date(dateTxt.value);
    postYear.value = dateObj.getFullYear();
    postMonth.value = dateObj.getMonth();
    postDay.value = dateObj.getDate();
  } else {
    dateObj = new Date();
    postYear.value = dateObj.getFullYear();
    postMonth.value = dateObj.getMonth();
    postDay.value = dateObj.getDate();
  }

  setEdit(blockString);
  addFocusEvent(postBlocks);

  newBlock.addEventListener("click", function(e) {
    var blockEl = document.createElement("div");
    var blockP = document.createElement("p");

    blockEl.classList.add("post-block");
    blockEl.contentEditable = true;
    blockP.innerHTML = "Block";
    blockEl.appendChild(blockP);

    addBlock(blockEl);

    return;
  }, false);

  newImg.addEventListener("click", function(e) {
    var blockEl = document.createElement("div");
    var blockImg = document.createElement("img");
    var imgSrc = prompt("Put img URL below");

    blockEl.contentEditable = true;
    blockEl.className += "post-block";
    blockImg.className += "post-block-image";
    blockImg.src = imgSrc;
    blockEl.appendChild(blockImg);

    addBlock(blockEl);

    return;
  }, false);

  delBlock.addEventListener("click", function(e) {
    if(currentBlock != null) {
      var delBlock = currentBlock;
      var parent = delBlock.parentNode;

      parent.removeChild(delBlock);
      currentBlock = null;
      return;
    }
    return;
  }, false);

  editBlock.addEventListener("click", function(e) {
    if(currentBlock != null) {
      var txtArea = document.createElement("textarea");
      var doneBtn = document.createElement("button");
      doneBtn.setAttribute("type", "button");
      doneBtn.setAttribute("class", "btn");
      doneBtn.innerHTML = "Done Editing";
      txtArea.setAttribute("rows", "12");
      txtArea.setAttribute("style", "width:100%;");
      txtArea.innerHTML = currentBlock.innerHTML;
      currentBlock.innerHTML = "";
      currentBlock.appendChild(txtArea);
      currentBlock.appendChild(doneBtn);

      doneBtn.addEventListener("click", function(e) {
        currentBlock.innerHTML = txtArea.value;
      }, false);
      return;
    }
    return;
  }, false);

  sendBtn.addEventListener("click", function(e) {
    var dateObjPost = new Date(Date.UTC(postYear.value, postMonth.value, postDay.value));
    var datePost = dateObjPost.toISOString().substr(0, 10);
    dateTxt.value = datePost;
    removeEdit(blockString);
    input.value = content.innerHTML;
    return postForm.submit();
  }, false);

  function addFocusEvent(blocks) {
    var i = 0;
    for(i = 0; i < blocks.length; i++) {
      blocks[i].addEventListener("focus", function(e) {
        currentBlock = e.target;
      }, false);
    }
    return;
  }

  function addBlock(blockEl) {
    blockEl.addEventListener("focus", function(e) {
      currentBlock = e.target;
      return;
    }, false);

    if(currentBlock == null) {
      return content.appendChild(blockEl).focus();
    }

    if(currentBlock != null) {
      insertAfter(blockEl, currentBlock);
      return blockEl.focus();
    }
    return;
  }
}

function publishInit(pubPubStr, pubUnpubStr, publishWrap, publishInput) {
  var pubBtn = document.getElementById(publishWrap);
  var pubInput = document.getElementById(publishInput);
  var pubPublished = document.getElementById(pubPubStr);
  var pubUnpublished = document.getElementById(pubUnpubStr);

  updateUIStatus(pubInput.value)

  pubBtn.addEventListener("click", function(e) {
    if(e.target.id === "published") {
      removeActive(pubBtn.childNodes);
      updateUIStatus(pubInput.value = "published")
    } else {
      removeActive(pubBtn.childNodes);
      updateUIStatus(pubInput.value = "unpublished")
    }
  }, false);

  function updateUIStatus(pubInputVal) {
    if(pubInputVal == "published") {
      pubPublished.classList.add("active");
    } else {
      pubUnpublished.classList.add("active");
    }
  }
}

function removeActive(nodes) {
  var i = 0;
  for(i = 0; i < nodes.length; i++) {
    if(nodes[i].nodeType === 1) {
      nodes[i].classList.remove("active");
    }
  }
  return;
}

function insertAfter(newNode, referenceNode) {
  return referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}

function setEdit(blockString) {
  var theBlocks = document.querySelectorAll(blockString);
  var i = 0;
  for(i = 0; i < theBlocks.length; i++) {
    theBlocks[i].contentEditable = true;
  }
  return;
}

function removeEdit(blockString) {
  var theBlocks = document.querySelectorAll(blockString);
  var i = 0;
  for(i = 0; i < theBlocks.length; i++) {
    theBlocks[i].removeAttribute("contenteditable");
  }
  return;
}

function mainImgInit(mainID, showID) {
  var main = document.getElementById(mainID);
  var show = document.getElementById(showID);
  main.addEventListener("click", function(e) {
    var newImg = document.createElement("img");
    var imgSrc = prompt("Put img URL below");
    newImg.src = imgSrc;
    show.innerHTML = "";
    show.appendChild(newImg);
  }, false)
}

//call function if element exists
document.addEventListener("DOMContentLoaded", function(e) {
  if(document.getElementById("postf-content") != null) {
    postInit(".post-block", "postf-content", "post_content", "new-block", "new-img", "del-block", "edit-block", "create-post", "post-form", "post_date", "postyear", "postmonth", "postday");
    publishInit("published", "unpublished", "publishwrap", "post_status");
    mainImgInit("main-pic", "main-pic-show");
  }
});
