FROM dotnet:2.1-sdk-alpine AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o .publish

FROM dotnet:2.1-aspnetcore-runtime-alpine
COPY z.mindaro.yaml /mindaro.yaml
WORKDIR /app
COPY --from=build /src/.publish .
ENTRYPOINT ["dotnet", "api.dll"]
