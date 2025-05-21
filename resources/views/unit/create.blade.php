{{Form::open(array('route'=>array('unit.store',$property_id),'method'=>'post'))}}
<div class="modal-body">
    <div class="row">
        <div class="form-group  col-md-12">
            {{Form::label('name',__('Name'),array('class'=>'form-label'))}}
            {{Form::text('name',null,array('class'=>'form-control','placeholder'=>__('Enter unit name')))}}
        </div>
        <div class="form-group  col-md-4">
            {{Form::label('bedroom',__('Bedroom'),array('class'=>'form-label'))}}
            {{Form::number('bedroom',null,array('class'=>'form-control','placeholder'=>__('Enter number of bedroom')))}}
        </div>
        <div class="form-group  col-md-4">
            {{Form::label('kitchen',__('Kitchen'),array('class'=>'form-label'))}}
            {{Form::number('kitchen',null,array('class'=>'form-control','placeholder'=>__('Enter number of kitchen')))}}
        </div>
        <div class="form-group  col-md-4">
            {{Form::label('baths',__('Bath'),array('class'=>'form-label'))}}
            {{Form::number('baths',null,array('class'=>'form-control','placeholder'=>__('Enter number of bath')))}}
        </div>
        <div class="form-group  col-md-6">
            {{Form::label('amount_due',__('Amount Due'),array('class'=>'form-label'))}}
            {{Form::number('amount_due',null,array('class'=>'form-control','placeholder'=>__('Enter unit amount due')))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('charge_type',__('Charge Type'),array('class'=>'form-label'))}}
            {{Form::select('charge_type',$chargeTypes,null,array('class'=>'form-control hidesearch','id'=>'charge_type'))}}
        </div>
        <div class="form-group  col-md-12 charge_type monthly ">
            {{Form::label('charge_duration',__('Charge Duration'),array('class'=>'form-label'))}}
            {{Form::number('charge_duration',null,array('class'=>'form-control','placeholder'=>__('Enter day of month between 1 to 30')))}}
        </div>
        <div class="form-group  col-md-12 charge_type yearly d-none">
            {{Form::label('charge_duration',__('Charge Duration'),array('class'=>'form-label'))}}
            {{Form::number('charge_duration',null,array('class'=>'form-control','placeholder'=>__('Enter month of year between 1 to 12'),'disabled'))}}
        </div>
        <div class="form-group  col-md-4 charge_type custom d-none">
            {{Form::label('start_date',__('Start Date'),array('class'=>'form-label'))}}
            {{Form::date('start_date',null,array('class'=>'form-control','disabled'))}}
        </div>
        <div class="form-group  col-md-4 charge_type custom d-none">
            {{Form::label('end_date',__('End Date'),array('class'=>'form-label'))}}
            {{Form::date('end_date',null,array('class'=>'form-control','disabled'))}}
        </div>
        <div class="form-group  col-md-4 charge_type custom d-none">
            {{Form::label('payment_due_date',__('Payment Due Date'),array('class'=>'form-label'))}}
            {{Form::date('payment_due_date',null,array('class'=>'form-control','disabled'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('deposit_type',__('Deposit Type'),array('class'=>'form-label'))}}
            {{Form::select('deposit_type',$types,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('deposit_amount',__('Deposit Amount'),array('class'=>'form-label'))}}
            {{Form::number('deposit_amount',null,array('class'=>'form-control','placeholder'=>__('Enter deposit amount')))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('late_fee_type',__('Late Fee Type'),array('class'=>'form-label'))}}
            {{Form::select('late_fee_type',$types,null,array('class'=>'form-control hidesearch'))}}
        </div>
        <div class="form-group col-md-6">
            {{Form::label('late_fee_amount',__('Late Fee Amount'),array('class'=>'form-label'))}}
            {{Form::number('late_fee_amount',null,array('class'=>'form-control','placeholder'=>__('Enter late fee amount')))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('incident_receipt_amount',__('Incident Receipt Amount'),array('class'=>'form-label'))}}
            {{Form::number('incident_receipt_amount',null,array('class'=>'form-control','placeholder'=>__('Enter incident receipt amount')))}}
        </div>
        <div class="form-group col-md-12">
            {{Form::label('notes',__('Notes'),array('class'=>'form-label'))}}
            {{Form::textarea('notes',null,array('class'=>'form-control','rows'=>2,'placeholder'=>__('Enter notes')))}}
        </div>
    </div>
</div>
<div class="modal-footer">
    <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">{{__('Close')}}</button>
    {{Form::submit(__('Create'),array('class'=>'btn btn-primary btn-rounded'))}}
</div>
{{ Form::close() }}
<script>
    $('#charge_type').on('change', function() {
        "use strict";
        var type=this.value;
        $('.charge_type').addClass('d-none')
        $('.'+type).removeClass('d-none')

        var input1= $('.charge_type').find('input');
        input1.prop('disabled', true);
        var input2= $('.'+type).find('input');
        input2.prop('disabled', false);
    });
</script>

