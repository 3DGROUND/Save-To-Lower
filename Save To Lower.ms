macroScript saveToLower
category:"[3DGROUND]"
toolTip:"Save To Lower"
buttontext:"Save To Lower"
(
	fn getMaxVersion =
	(
		v = maxVersion()
		v = (v[1] / 1000) - 2
		
		case v of 
		(
			11: #(2010,2011)
			12: #(2010,2011,2012)
			13: #(2010,2011,2012,2013)
			14: #(2011,2012,2013,2014)
			15: #(2012,2013,2014,2015)
			16: #(2013,2014,2015,2016)
			17: #(2014,2015,2016,2017)
			18: #(2015,2016,2017,2018)
			19: #(2016,2017,2018,2019)
			20: #(2017,2018,2019,2020)
			default: #(2000 + v)
		)
	)
	
	fn getPath = maxFilePath + maxFileName
	
	on execute do (		
		local v = getMaxVersion()
		local s = getPath()
		if(s == "") do 	max file save				
		s = getPath()
		if(s.count > 3) do (
			print ("Saved for 3Ds Max " + v[1] as string)
			saveMaxFile s saveAsVersion:v[1] useNewFile:false quiet:true		
		)
	)
)