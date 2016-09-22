function Initialize()

	MeasureTime = SKIN:GetMeasure('MeasureTime')

		tLookup = {}
		
		tLookup['0'] = 'oh'
		tLookup['1'] = 'one'
		tLookup['2'] = 'two'
		tLookup['3'] = 'three'
		tLookup['4'] = 'four'
		tLookup['5'] = 'five'
		tLookup['6'] = 'six'
		tLookup['7'] = 'seven'
		tLookup['8'] = 'eight'
		tLookup['9'] = 'nine'
		tLookup['10'] = 'ten'
		tLookup['11'] = 'eleven'
		tLookup['12'] = 'twelve'
		tLookup['13'] = 'thirteen'
		tLookup['14'] = 'fourteen'
		tLookup['15'] = 'fifteen'
		tLookup['16'] = 'sixteen'
		tLookup['17'] = 'seventeen'
		tLookup['18'] = 'eighteen'
		tLookup['19'] = 'nineteen'

end --> function Initialize

function Update()

	FullTime = MeasureTime:GetStringValue()
	Loc, Len = string.find(FullTime, ':')
	HoursText = tLookup[string.sub(FullTime,1,Loc-1)]
	MinutesLeft = string.sub(FullTime,Loc+1,string.len(FullTime)-1)
	MinutesRight = string.sub(FullTime,string.len(FullTime),string.len(FullTime))
	
	if tonumber(MinutesLeft) == 0 then
		MinutesLeftText = string.upper(tLookup[MinutesLeft])
		MinutesRightText = tLookup[MinutesRight]
	elseif tonumber(MinutesLeft) == 1 then
		MinutesLeftText = string.upper(tLookup[MinutesLeft..MinutesRight])
		MinutesRightText = ''
	else
		if tonumber(MinutesLeft) == 2 then
			MinutesLeftText = 'TWENTY'
		elseif tonumber(MinutesLeft) == 3 then
			MinutesLeftText = 'THIRTY'
		elseif tonumber(MinutesLeft) == 4 then
			MinutesLeftText = 'FORTY'
		elseif tonumber(MinutesLeft) == 5 then
			MinutesLeftText = 'FIFTY'
		end
		MinutesRightText = tLookup[MinutesRight]
		if MinutesRightText == 'oh' then
			MinutesRightText = ''
		end
	end
	
	if MinutesLeftText == 'OH' and MinutesRightText == 'oh' then
		MinutesLeftText = 'O\'CLOCK'
		MinutesRightText = ''
	end
	
	SKIN:Bang('!SetOption', 'MeterHours', 'Text', HoursText)
	SKIN:Bang('!SetOption', 'MeterMinutesLeft', 'Text', MinutesLeftText)
	SKIN:Bang('!SetOption', 'MeterMinutesRight', 'Text', MinutesRightText)
	
	return HoursText..MinutesLeftText..MinutesRightText
	
end --> function Update
