<div id="slideshow<?php echo $module; ?>" class="owl-carousel slideshow">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
  $('#slideshow<?php echo $module; ?>').owlCarousel({
    items: 1, //显示数量
    loop: true, //循环滚动
    autoplay: true, //自动播放
    autoplayTimeout: 3000, //自动切换时间（毫秒）
    autoplayHoverPause: true, //鼠标移动到图片上面时，是否暂停自动播放
    autoplaySpeed: 300, //自动播放图片切换动画时长
    navSpeed: 400, //左右切换按钮图片切换动画时长
    dotsSpeed: 300, //点击图片下方黑点图片切换动画时长
    nav: true, //是否显示左右切换按钮
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'], //左右切换按钮图标
    dots: true, //是否显示图片下方黑点
  });
});
--></script>