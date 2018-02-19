<div class="sidebar-widget">
  <div class="sidebar-widget-title"><?php echo $heading_title; ?></div>
  <div class="sidebar-widget-content">
    <ul class="list-unstyled category-list">
      <?php foreach ($categories as $category) { ?>
      <li class="<?php echo $category['category_id'] == $category_id ? 'active' : '' ?>"><span></span><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
        <?php if ($category['children']): ?>
        <ul class="list-unstyled">
          <?php foreach ($category['children'] as $child): ?>
          <li class="<?php echo $child['category_id'] == $child_id ? 'active' : '' ?>"><span></span><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
          <?php endforeach ?>
        </ul>
        <?php endif ?>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>