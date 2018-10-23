<style type="text/css">
    #easebuzz-pay {cursor: pointer}
    #easebuzz-error {color: #CC0000; font-weight: bold}
</style>


<div class="buttons">
  <div class="pull-right">
    <input type="button" value="Make payment" id="easebuzz-pay" class="btn btn-primary" data-loading-text="Please wait..." />
  </div>
</div>
<div id="easebuzz-error"></div>
<script type="text/javascript">
    var clicked=0;
    $('#easebuzz-pay').on('click', function() {
        if(clicked>=1){
            return false;
        }
        clicked+=1;
        $.ajax({
            type: 'get',
            url: '<?php echo $action; ?>',
            cache: false,
            dataType: 'json',
            beforeSend: function () {
                $('#easebuzz-error').empty();
                $('#easebuzz-pay').css('cursor', 'wait');
            },
            complete: function () {
                $('#easebuzz-pay').css('cursor', 'pointer');
            },
            success: function (ret) {
                if (ret.status == '1') {
                    location = ret.data
                } else {
                    $('#easebuzz-error').empty().append(ret.data);
                }
            }
        });
    });
</script>


