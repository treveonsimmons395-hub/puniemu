FROM ://microsoft.com AS build
WORKDIR /src
COPY . .
RUN dotnet publish Puniemu.csproj -c Release -o /app

FROM ://microsoft.com
WORKDIR /app
COPY --from=build /app .
COPY appsettings.json .
ENV ASPNETCORE_URLS=http://0.0.0
EXPOSE 10000
ENTRYPOINT ["dotnet", "Puniemu.dll"]
