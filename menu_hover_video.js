//                    首頁安全帽 防摔衣 防摔手套滑鼠移入的影片效果(網路素材的影片)
//------------------------------------------------------------------------------------------

// 取得元素
const videoBackground = document.getElementById('video-background');
const helmetLink = document.getElementById('video_helmet_link');
const suitLink = document.getElementById('video_suit_link');
const handLink = document.getElementById('video_hand_link');

// 當滑鼠移到不同元素時更改視頻
helmetLink.addEventListener('mouseover', () => {
  videoBackground.src = './images/video_helmet_link.mp4'; // 播放 video_helmet_link.mp4
  videoBackground.play();
});

suitLink.addEventListener('mouseover', () => {
  videoBackground.src = './images/video_suit_link.mp4'; // 播放 video_suit_link.mp4
  videoBackground.play();
});

handLink.addEventListener('mouseover', () => {
  videoBackground.src = './images/video_hand_link.mp4'; // 播放 video_hand_link.mp4
  videoBackground.play();
});

// 可以根據需要，當滑鼠移開時停止播放或恢復原來的視頻
helmetLink.addEventListener('mouseleave', () => {
  videoBackground.src = './images/index_video.mp4'; // 恢復原來的視頻
  videoBackground.play();
});

suitLink.addEventListener('mouseleave', () => {
  videoBackground.src = './images/index_video.mp4'; // 恢復原來的視頻
  videoBackground.play();
});

handLink.addEventListener('mouseleave', () => {
  videoBackground.src = './images/index_video.mp4'; // 恢復原來的視頻
  videoBackground.play();
});

//在menu_hover_video_useMyVideo.js有詳細解釋程式碼內容