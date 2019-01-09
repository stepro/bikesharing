FROM dotnet:2.1-sdk-alpine AS build
COPY z.mindaro.yaml /mindaro.yaml
ENV ASPNETCORE_ENVIRONMENT=Development
WORKDIR /src
COPY . .
RUN dotnet build
ENTRYPOINT ["dotnet", "run"]
