FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

COPY entrypoint.sh .
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh"]
