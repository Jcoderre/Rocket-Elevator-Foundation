# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    # Hide option of the cascading dropdown menu
    #$('#intervention_building_id').parent().hide()
    buildings = $('#intervention_building_id').html()
    #$('#intervention_battery_id').parent().hide()
    batteries = $('#intervention_battery_id').html()
    #$('#intervention_column_id').parent().hide()
    columns = $('#intervention_column_id').html()
    #$('#intervention_elevator_id').parent().hide()
    elevators = $('#intervention_elevator_id').html()

    #Function to select your customer and show the building menu
    $('#intervention_customer_id').change ->
        customer = $('#intervention_customer_id :selected').text()
        escaped_customer = customer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(buildings).filter("optgroup[label=#{escaped_customer}]").html()
        console.log(options)
        if options
            $('#intervention_building_id').html(options)
            $('#intervention_building_id').parent().show() 
        else
            $('#intervention_building_id').empty()
            $('#intervention_building_id').parent().hide()

    #Function to select your Building and show the battery menu
    $('#intervention_building_id').change ->
        building = $('#intervention_building_id :selected').text()
        escaped_building = building.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(batteries).filter("optgroup[label=#{escaped_building}]").html()
        console.log(options)
        if options
            $('#intervention_battery_id').html(options)
            $('#intervention_battery_id').parent().show() 
        else
            $('#intervention_battery_id').empty()
            $('#intervention_battery_id').parent().hide()

    #Function to select your battery and show the column menu
    $('#intervention_battery_id').change ->
        battery = $('#intervention_battery_id :selected').text()
        escaped_battery = battery.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(columns).filter("optgroup[label=#{escaped_battery}]").html()
        console.log(options)
        if options
            $('#intervention_column_id').html(options)
            $('#intervention_column_id').parent().show() 
        else
            $('#intervention_column_id').empty()
            $('#intervention_column_id').parent().hide()

    #Function to select your column and show the elevator menu
    $('#intervention_column_id').change ->
        column = $('#intervention_column_id :selected').text()
        escaped_column = column.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(elevators).filter("optgroup[label=#{escaped_column}]").html()
        console.log(options)
        if options
            $('#intervention_elevator_id').html(options)
            $('#intervention_elevator_id').parent().show() 
        else
            $('#intervention_elevator_id').empty()
            $('#intervention_elevator_id').parent().hide()
