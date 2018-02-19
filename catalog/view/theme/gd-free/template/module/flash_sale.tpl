<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12 flash_sale_widget">
    <div class="product-wrapper">
      <div class="product-image">
      <a href="<?php echo $product['href']; ?>" class="flash-mrak">
      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['product_name']; ?>" title="<?php echo $product['product_name']; ?>" class="img-responsive" />
      </a>
      </div>
      <div class="product-info">
      <div class="product-name flash-sole"><a href="<?php echo $product['href']; ?>"><?php echo $product['product_name']; ?></a></div>
        <?php if ($product['seconds_to_start']) { ?>
        <div class="countdown" id="flash-sale-<?php echo $product['product_id']?>-countdown" data-countdown="<?php echo $product['start_time']; ?>">
          <span>0<div><?php echo $text_day; ?></div></span>
          <span>0<div><?php echo $text_hour; ?></div></span>
          <span>0<div><?php echo $text_minute; ?></div></span>
          <span>0<div><?php echo $text_second; ?></div></span>
        </div>
        <?php } elseif ($product['seconds_to_end'] && ($product['used_quantity'] < $product['quantity'])) {?>
        <div class="countdown" id="flash-sale-<?php echo $product['product_id']?>-countdown">
          <div class="in-progress"><?php echo $text_flash_sale_in_progress; ?></div>
        </div>
        <?php } else { ?>
        <div class="countdown" id="flash-sale-<?php echo $product['product_id']?>-countdown">
          <div class="ended"><?php echo $text_flash_sale_none; ?></div>
        </div>
        <?php } ?>
        <div class="product-price">
          <span class="price-new ps-color"><?php echo $product['flash_sale_price']; ?></span><span class="price-old"><?php echo $product['original_price']; ?></span>
        </div>
        <div class="quantity"><span class="quantity"><?php echo $text_quantity; ?><?php echo $product['display_quantity'] ?></span></div>
        <?php if ($product['seconds_to_start']) { ?>
        <a class="open-page enabled" href="<?php echo $product['href']; ?>"><?php echo $text_flash_sale_soon; ?></a>
        <?php } elseif ($product['seconds_to_end'] && ($product['used_quantity'] < $product['quantity'])) {?>
        <a class="open-page enabled" href="<?php echo $product['href']; ?>"><?php echo $text_flash_sale_in_now; ?></a>
        <?php } else {?>
        <a class="open-page disabled" href="<?php echo $product['href']; ?>"><?php echo $text_flash_sale_ended; ?></a>
        <?php } ?>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('[data-countdown]').each(function() {
  var $this = $(this), timeToStart = $(this).data('countdown');

  $this.countdown(timeToStart)
  .on('update.countdown', function(event) {
    $this.html(event.strftime('<span>%D<div><?php echo $text_day; ?></div></span><span>%H<div><?php echo $text_hour; ?></div></span><span>%M<div><?php echo $text_minute; ?></div></span><span>%S<div><?php echo $text_second; ?></div></span>'));
  })
  .on('finish.countdown', function(event) {
    $(this).html('<div class="in-progress"><?php echo $text_flash_sale_in_progress; ?></div>');
    $(this).siblings('.open-page').html('<?php echo $text_flash_sale_in_now; ?>');
  });
});
//--></script>