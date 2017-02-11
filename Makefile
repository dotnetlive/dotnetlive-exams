start:
	systemctl start kestrel-dotnetlive-exam.service

stop:
	systemctl stop kestrel-dotnetlive-exam.service

delete_current_build:
	rm -rf /var/dotnetlive/pubsite/dotnetlive.exam/

publish:
	git clean -df
	git pull
	dotnet restore src/DotNetLive.ExamWeb.sln 
	cd src/DotNetLive.ExamWeb && npm install && bower install --allow-root && gulp default
	dotnet publish src/DotNetLive.ExamWeb/DotNetLive.ExamWeb.csproj -c "Release" -o /var/dotnetlive/pubsite/dotnetlive.exam/ 

deploy: stop publish start
