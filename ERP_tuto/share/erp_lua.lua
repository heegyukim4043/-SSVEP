
function initialize(box)

	dofile(box:get_config("${Path_Data}") .. "/plugins/stimulation/lua-stimulator-stim-codes.lua")

	-- each stimulation sent that gets rendered by Display Cue Image box 
	-- should probably have a little period of time before the next one or the box wont be happy
	pre_baseline_duration = 1
	baseline_duration = 2
	post_baseline_duration = 1
	cross_duration = 2
	post_cross_duration = 0
	pre_cue_duration = 0.2
	display_cue_duration = 0.2
	post_cue_duration = 0.6
	post_end_duration = 1

	sequence = {
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
        OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_02,
	}
	
end

function process(box)

	local t = 0

	-- Delays before the trial sequence starts
	box:send_stimulation(1, OVTK_StimulationId_ExperimentStart, t, 0)
	t = t + pre_baseline_duration

	box:send_stimulation(1, OVTK_StimulationId_BaselineStart, t, 0)
	t = t + baseline_duration

	box:send_stimulation(1, OVTK_StimulationId_BaselineStop, t, 0)
	t = t + post_baseline_duration

    box:send_stimulation(1, OVTK_GDF_Cross_On_Screen, t, 0)
	t = t + cross_duration


	-- creates each trial
	for i = 1, #sequence do

		-- first display a cross on screen
		box:send_stimulation(1, OVTK_GDF_Start_Of_Trial, t, 0)
		t = t + pre_cue_duration
	
		-- display cue
		box:send_stimulation(1, sequence[i], t, 0)
		t = t + display_cue_duration

		-- clear cue. 
		box:send_stimulation(1, OVTK_StimulationId_VisualStimulationStop, t, 0)
		t = t + post_cue_duration
		
		-- end of rest and trial
		box:send_stimulation(1, OVTK_GDF_End_Of_Trial, t, 0)
	end

	-- send end for completeness	
	box:send_stimulation(1, OVTK_GDF_End_Of_Session, t, 0)
	t = t + 5

	-- used to cause the acquisition scenario to stop and denote final end of file
	box:send_stimulation(1, OVTK_StimulationId_ExperimentStop, t, 0)
	
end
