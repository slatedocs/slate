bundle exec middleman build --clean
aws s3 sync build/index.html  s3://pt_public/api/slate-apiv2/index.html --acl public-read
aws cloudfront create-invalidation --distribution-id E2V3PVGRJTV0N8 --paths /api/slate-apiv2/index.html
