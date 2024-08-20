# write a dockerfile that downloads llamafile executible and uses a cache to check if it needs to download one 
# or not
FROM docker.io/alpine AS build
COPY scripts /scripts
RUN ls scripts/
RUN --mount=type=cache,target=/var/cache/llamafile /scripts/download-llamafile.sh && cp /var/cache/llamafile/llamafile /llamafile

FROM docker.io/alpine
COPY --from=build --chmod=755 /llamafile /usr/local/bin/llamafile
EXPOSE 8080
ENV MODEL_PATH=/model

# Define the entrypoint script
ENTRYPOINT ["/bin/sh"]
CMD ["-c", "/usr/local/bin/llamafile -m $MODEL_PATH --nobrowser --server --host 0.0.0.0"]
