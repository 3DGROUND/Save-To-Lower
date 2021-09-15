macroScript saveToLower
category:"[3DGROUND]"
toolTip:"Save To Lower"
buttontext:"Save To Lower"
(
	-- Version 2.0.0
	-- MastaMan
	-- https://3dground.net/
	
	fn getMaxVersion = (
		v = maxVersion()
        v = (v[1] / 1000) - 2
        
        a = 2000 + v
        
        o = case v of (
            11: #(a - 1, a)
            12: #(a - 2, a - 1, a)
            default: #(a - 3, a - 2, a - 1, a)
        )
        
        return (for i in o collect i)
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