function getJobTitleFromID(jobID)
	if (tonumber(jobID)==1) then
		return "Kurýr"
	elseif (tonumber(jobID)==2) then
		return "Řidič taxíku"
	elseif  (tonumber(jobID)==3) then
		return "Řidič autobusu"
	elseif (tonumber(jobID)==4) then
		return "Údržba města"
	elseif (tonumber(jobID)==5) then
		return "Mechanic"
	elseif (tonumber(jobID)==6) then
		return "Locksmith"
	elseif (tonumber(jobID)==7) then
		return "Long Haul Truck Driver"
	else
		return "Unemployed"
	end
end