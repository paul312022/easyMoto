<?php
//廣告輪播資料查詢
$SQLstring = "select * from carousel where caro_online=1 order by caro_sort";
$carousel = $link->query($SQLstring);
$i = 0;
?>
<section id="content">
  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators mb-5">
      <?php for ($i = 0; $i < $carousel->rowCount(); $i++) { ?>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="<?php echo $i; ?>" class="<?php echo activeShow($i, 0); ?>" aria-current="true" aria-label="Slide <?php echo $i; ?>"></button>
      <?php } ?>
    </div>
    <!-- 輪播廣告區 -->
    <div class="carousel-inner">
      <?php
      $i = 0;
      while ($data = $carousel->fetch()) {
      ?>
        <div class="carousel-item <?php echo activeShow($i, 0); ?>">
          <img src="show_img/<?php echo $data['caro_pic']; ?>" class="d-block w-100 showimg" alt="<?php echo $data['caro_title']; ?>">
          <div class="carousel-caption d-none d-md-block mb-5">
            <h5><?php echo $data['caro_title']; ?></h5>
            <p><?php echo $data['caro_content']; ?></p>
          </div>
        </div>
      <?php $i++;
      } ?>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</section>