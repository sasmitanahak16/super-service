 FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
 WORKDIR /app
 EXPOSE 80
 FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
 WORKDIR /src
 COPY ./src .
 RUN dotnet restore "./SuperService.csproj"
 WORKDIR "/src/."
 RUN dotnet build "SuperService.csproj" -c Release -o /app/build
 FROM build AS publish
 RUN dotnet publish "SuperService.csproj" -c Release -o /app/publish
 FROM base AS final
 WORKDIR /app
 COPY --from=publish /app/publish .
 ENTRYPOINT ["dotnet", "SuperService.dll"]