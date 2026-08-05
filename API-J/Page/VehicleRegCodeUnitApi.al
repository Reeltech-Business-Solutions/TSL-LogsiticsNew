codeunit 50044 "vehicleregistration"
{
    procedure CreateVehicleRegistration(
        narrative_of_problem: Text[100];
        // service_item: code[20];
        location_code: code[20];
        fleet_No: Code[20];
    fleet_manager_name: Text[100];
    fleet_manager_phone_no: code[30];
    fleet_manager_location: code[20];
    fleet_manager_email: code[150];
    engine_wont_start: Boolean;
    engine_overheating: Boolean;
    engine_misfiring_or_rough_idling: Boolean;
    unusual_engine_noise: Boolean;
    reduced_engine_power: Boolean;
    check_Engine_light_is_on: Boolean;
    battery_wont_hold_charge: Boolean;
    vehicle_wont_start_due_to_battery: Boolean;
    electrical_components_no_working: Boolean;
    dashboard_lights_flickering: Boolean;
    alternator_issue: Boolean;
    oil_leak_under_vehicle: Boolean;
    coolant_leak: Boolean;
    fuel_leak_smell: Boolean;
    low_oil_level: Boolean;
    transmission_fluid_leak: Boolean;
    brake_fluid_leak: Boolean;
    squeaking_or_grinding_noise_when_braking: Boolean;
    brake_pedal_feels_soft_or_spongy: Boolean;
    vehicle_pulls_to_one_side_while_braking: Boolean;
    abs_warning_light_is_on: Boolean;
    reduced_braking_performance: Boolean;
    loud_exhaust_noise: Boolean;
    excess_smoke_from_exhaust: Boolean;
    exhaust_smell_inside_the_vehicle: Boolean;
    flat_tire: Boolean;
    uneven_tire_wear: Boolean;
    tire_pressure_warning_light_on: Boolean;
    steering_wheel_vibration: Boolean;
    wheel_alignment_issue: Boolean;
    difficulty_shifting_gears: Boolean;
    gear_slipping: Boolean;
    unusual_noise_from_transmission: Boolean;
    transmission_fluid_leaks: Boolean;
    headlights_not_working: Boolean;
    brake_light_not_working: Boolean;
    turn_signal_not_working: Boolean;
    dashboard_warning_lights_on: Boolean;
    air_conditioning_not_cooling: Boolean;
    heater_not_working: Boolean;
    strange_odor_from_vents: Boolean;
    fan_not_working: Boolean;
    power_windows_not_working: Boolean;
    doors_wont_lock_unlock_properly: Boolean;
    side_rear_view_mirror_damaged: Boolean;
    windshield_wipers_not_functioning: Boolean;
    seat_belt_not_functioning: Boolean;
    strange_noise_inside_cabin: Boolean;
    unusual_vibration_inside_vehicle: Boolean;
    driver_seat_adjustment_not_working: Boolean;
    suspension_feels_bouncy_or_stiff: Boolean;
    vehicle_tilts_to_one_side: Boolean;
    noise_from_under_the_vehicle_when_driving_over_bumps: Boolean;
    alarm_not_working: Boolean;
    vehicle_wont_start_due_to_immobilizer: Boolean;
    unusual_smells_inside_the_car: Boolean;
    others: Text;
    vehicle_reporting_date: Date;
    vehicle_reporting_time: Time
    ): Text

    var

        JsonObjects: JsonObject;
        vehicleRegistration: Record "Vehicle Registration";
        JsonResponse: Text;


    begin

        vehicleRegistration.Init();

        vehicleRegistration."Narrative of Problem" := narrative_of_problem;

        vehicleRegistration."FLeet No." := fleet_No;

        vehicleRegistration."Location Code" := location_code;

        vehicleRegistration."Fleet Manager Name" := fleet_manager_name;

        vehicleRegistration."Fleet Manager Phone No." := fleet_manager_phone_no;

        vehicleRegistration."Fleet  Manager E-Mail" := fleet_manager_email;

        VehicleRegistration."Engine won't start" := engine_wont_start;

        VehicleRegistration."Engine overheating" := engine_overheating;

        VehicleRegistration."Engine misfiring or rough idling" := engine_misfiring_or_rough_idling;

        VehicleRegistration."Unusual engine noise (knocking, ticking)" := unusual_engine_noise;

        VehicleRegistration."Reduced engine power" := reduced_engine_power;

        VehicleRegistration."Check Engine light is on" := check_Engine_light_is_on;

        VehicleRegistration."Battery won't hold charge" := battery_wont_hold_charge;

        VehicleRegistration."vehicle won't start due to battery" := vehicle_wont_start_due_to_battery;

        VehicleRegistration."Electrical Issues" := electrical_components_no_working;

        VehicleRegistration."Dashboard lights flickering" := dashboard_lights_flickering;

        VehicleRegistration."Alternator issue" := alternator_issue;

        vehicleRegistration."Oil leak under vehicle" := oil_leak_under_vehicle;

        VehicleRegistration."Coolant leak" := coolant_leak;

        VehicleRegistration."Fuel leak/smell" := fuel_leak_smell;

        VehicleRegistration."Low oil level" := low_oil_level;

        VehicleRegistration."Transmission fluid leak" := transmission_fluid_leak;

        VehicleRegistration."Brake fluid leak" := brake_fluid_leak;

        VehicleRegistration."Squeaking or grinding noise when braking" := squeaking_or_grinding_noise_when_braking;

        VehicleRegistration."Brake pedal feels soft or spongy" := brake_pedal_feels_soft_or_spongy;

        VehicleRegistration."Vehicle pulls to one side while braking" := vehicle_pulls_to_one_side_while_braking;

        VehicleRegistration."ABS warning light is on" := abs_warning_light_is_on;

        VehicleRegistration."Reduced braking performance" := reduced_braking_performance;

        VehicleRegistration."Loud exhaust noise" := loud_exhaust_noise;

        VehicleRegistration."Excess smoke from exhaust" := excess_smoke_from_exhaust;

        VehicleRegistration."Exhaust smell inside the vehicle" := exhaust_smell_inside_the_vehicle;

        VehicleRegistration."Flat tire" := flat_tire;

        VehicleRegistration."Uneven tire wear" := uneven_tire_wear;

        VehicleRegistration."Tire pressure warning light on" := tire_pressure_warning_light_on;

        vehicleRegistration."Steering wheel vibration" := steering_wheel_vibration;

        VehicleRegistration."Wheel alignment issue" := wheel_alignment_issue;

        VehicleRegistration."Difficulty shifting gears" := difficulty_shifting_gears;

        vehicleRegistration."Gear slipping" := gear_slipping;

        VehicleRegistration."Unusual noise from transmission" := unusual_noise_from_transmission;

        VehicleRegistration."Transmission fluid leak" := transmission_fluid_leaks;

        VehicleRegistration."Headlights not working" := headlights_not_working;

        VehicleRegistration."Brake lights not working" := brake_light_not_working;

        VehicleRegistration."Turn signals not working" := turn_signal_not_working;

        VehicleRegistration."Dashboard warning lights on" := dashboard_warning_lights_on;

        VehicleRegistration."Air conditioning not cooling" := air_conditioning_not_cooling;

        VehicleRegistration."Heater not working" := heater_not_working;

        VehicleRegistration."Strange odor from vents" := strange_odor_from_vents;

        VehicleRegistration."Fan not working" := fan_not_working;

        vehicleRegistration."Power windows not working" := power_windows_not_working;

        VehicleRegistration."Doors won’t lock/unlock properly" := doors_wont_lock_unlock_properly;

        VehicleRegistration."Side/rear-view mirror damaged" := side_rear_view_mirror_damaged;

        VehicleRegistration."Windshield wipers not functioning" := windshield_wipers_not_functioning;

        VehicleRegistration."Seat belt not functioning" := seat_belt_not_functioning;

        VehicleRegistration."Strange noise inside cabin" := strange_noise_inside_cabin;

        VehicleRegistration."Unusual vibration inside vehicle" := unusual_vibration_inside_vehicle;

        vehicleRegistration."•Driver seat adjustment not working" := driver_seat_adjustment_not_working;

        VehicleRegistration."Suspension feels bouncy or stiff" := suspension_feels_bouncy_or_stiff;

        VehicleRegistration."Vehicle tilts to one side" := vehicle_tilts_to_one_side;

        VehicleRegistration."Noise from under the vehicle when driving over bumps" := noise_from_under_the_vehicle_when_driving_over_bumps;

        VehicleRegistration."Alarm not working" := alarm_not_working;

        VehicleRegistration."Vehicle won’t start due to immobilizer" := vehicle_wont_start_due_to_immobilizer;

        VehicleRegistration."Unusual smells inside the car" := unusual_smells_inside_the_car;

        vehicleRegistration."Other (please specify)" := others;

        vehicleRegistration."Vehicle Reporting Date" := vehicle_reporting_date;

        vehicleRegistration."Vehicle Reporting Time" := vehicle_reporting_time;





        if vehicleRegistration.Insert(true) then begin
            JsonObjects.Add('Status', 'Success');
            JsonObjects.Add('Message', 'Vehicle registration created successfully');
            JsonObjects.Add('Vehicle_Registration_Id', Format(vehicleRegistration."Registration ID"));
            // JsonObjects.writeTo(jsonRes);
            // exit(jsonObjects);
        end
        else begin
            JsonObjects.Add('Status', 'failed');
            JsonObjects.Add('Message', 'Creation of vehicle registration failed');
            // exit(jsonObjects);
        end;

        JsonObjects.WriteTo(JsonResponse);
        exit(JsonResponse);

        // JsonObjects.writeTo(jsonRes);


    end;
}
