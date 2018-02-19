<h2 class="widget-title"><span><?php echo $heading_title; ?></span></h2>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-wrapper">
      <div class="product-image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="product-info">
        <div class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <div class="product-description"><p><?php echo $product['description']; ?></p></div>
        <?php if ($product['price']) { ?>
        <div class="product-rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <div class="product-price">
          <span class="price-new"><?php echo $product['special'] ? $product['special'] : $product['price']; ?></span>
          <?php if ($product['special']) { ?><span class="price-old"><?php echo $product['price']; ?></span><?php } ?>
          <?php if ($product['tax']) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
            <?php } ?>
        </div>
        <?php } ?>
        <div class="product-action">
          <button type="button" class="add-to-cart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span><?php echo $button_cart; ?></span></button>
          <div class="ps-add-buyincang" id="btn-visible">
            <button type="button" class="wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i> <span><?php echo $button_wishlist; ?></span></button>
            <button type="button" class="compare" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-bars"></i> <span><?php echo $button_compare; ?></span></button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
