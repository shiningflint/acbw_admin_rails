"use strict";

function postInit(blockString, contentString, contentInput, newBlockString, newImgString, delBlockString, sendBtnString, postFormString) {
	var content = document.getElementById(contentString);
	var input = document.getElementById(contentInput);
	var newBlock = document.getElementById(newBlockString);
	var newImg = document.getElementById(newImgString);
	var delBlock = document.getElementById(delBlockString);
	var postBlocks = document.querySelectorAll(blockString);
	var sendBtn = document.getElementById(sendBtnString);
	var postForm = document.getElementById(postFormString);
	var currentBlock = null;

	setEdit(blockString);
	addFocusEvent(postBlocks);

	newBlock.addEventListener("click", function(e) {
		var blockEl = document.createElement("div");
		var blockP = document.createElement("p");
		blockEl.classList.add("post-block");
		blockEl.contentEditable = true;
		blockP.innerHTML = "New Block";
		blockEl.appendChild(blockP);

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
	}, false);

	newImg.addEventListener("click", function(e) {
		var blockEl = document.createElement("div");
		var blockImg = document.createElement("img");
		var imgSrc = prompt("Put img URL below");

		blockImg.src = imgSrc;
		blockEl.appendChild(blockImg);

		console.log(blockEl);
		console.log(blockImg);
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

	sendBtn.addEventListener("click", function(e) {
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
}

function publishInit(publishWrap, publishInput) {
	var pubBtn = document.getElementById(publishWrap);
	var pubInput = document.getElementById(publishInput);

	pubBtn.addEventListener("click", function(e) {
		if(e.target.id === "published") {
			removeActive(pubBtn.childNodes);
			e.target.classList.add("active");
			pubInput.value = "published";
		} else {
			removeActive(pubBtn.childNodes);
			e.target.classList.add("active");
			pubInput.value = "unpublished";
		}
	}, false);
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

//call function if element exists
document.addEventListener("DOMContentLoaded", function(e) {
  if(document.getElementById("postf-content") != null) {
    postInit(".post-block", "postf-content", "postfid", "new-block", "new-img", "del-block", "create-post", "post-form");
    publishInit("publishwrap", "publinput");
  }
});
