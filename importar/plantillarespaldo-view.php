<?php
if (! empty($response)) {
    ?>
<div class="response <?php echo $response["type"]; ?>
    ">
    <?php echo nl2br($response["message"]); ?>
</div>
<?php
}
?>
<form method="post" action="" enctype="multipart/form-data"
    id="frm-restore">
    <div class="form-row">
        <div>Seleccionar base de datos</div>
        <div>
            <input type="file" name="backup_file" class="input-file" />
        </div>
    </div>
    <div>
        <input type="submit" name="restore" value="Restore"
            class="btn-action" />
    </div>
</form>