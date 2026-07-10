#!/usr/bin/env bash
# spec-code-pm init — 项目脚手架初始化
# 用法: init-project.sh [project_dir] [--output-dir <path>]

set -euo pipefail

PROJECT_DIR="."
OUTPUT_DIR=""

# 解析参数
while [[ $# -gt 0 ]]; do
    case "$1" in
        --output-dir)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        *)
            PROJECT_DIR="$1"
            shift
            ;;
    esac
done

TEMPLATES_DIR="$(cd "$(dirname "$0")/../assets/templates" && pwd)"

if [[ ! -d "$TEMPLATES_DIR" ]]; then
    echo "❌ Templates directory not found: $TEMPLATES_DIR"
    exit 1
fi

# 确定输出目录（默认与项目同级）
REAL_PROJECT="$(realpath "$PROJECT_DIR")"
if [[ -z "$OUTPUT_DIR" ]]; then
    OUTPUT_DIR="$REAL_PROJECT"
    echo "📋 使用默认输出目录: $OUTPUT_DIR"
else
    OUTPUT_DIR="$(realpath -m --relative-to="$REAL_PROJECT" "$OUTPUT_DIR" 2>/dev/null || echo "$OUTPUT_DIR")"
    echo "📋 使用指定输出目录: $OUTPUT_DIR (相对于 $REAL_PROJECT)"
fi

SPECS_DIR="$OUTPUT_DIR/specs"
STEERING_DIR="$OUTPUT_DIR/steering"
RELEASES_DIR="$OUTPUT_DIR/releases"

# 规范化相对路径供 config 使用
if [[ "$OUTPUT_DIR" == "$REAL_PROJECT" ]]; then
    CONFIG_OUTPUT_DIR="."
else
    CONFIG_OUTPUT_DIR="$OUTPUT_DIR"
fi

echo "📋 Initializing spec-code-pm in: $REAL_PROJECT"

mkdir -p "$SPECS_DIR" "$STEERING_DIR" "$RELEASES_DIR"

# 复制 steering 模板 (Phase 0 + Phase 1)
for tpl in constitution.md product.md ubiquitous-lang.md bounded-context.md; do
    if [[ -f "$STEERING_DIR/$tpl" ]]; then
        echo "  ⏭️  $STEERING_DIR/$tpl (已存在)"
    else
        cp "$TEMPLATES_DIR/$tpl" "$STEERING_DIR/$tpl"
        echo "  ✅  $STEERING_DIR/$tpl"
    fi
done

# 创建输出目录配置
cat > "$REAL_PROJECT/.specpmrc" <<EOF
# spec-code-pm 配置
output_dir=$CONFIG_OUTPUT_DIR
phase_mode=sequential
auto_analyze=true
# 增量开发模式: true (增量) / false (全量)
# 增量模式下 Phase 2/4/6 产出 delta 文件而非重写全量工件
incremental=false
EOF

echo "  ✅  $REAL_PROJECT/.specpmrc"

echo ""
echo "✅ 初始化完成"
echo ""
echo "下一步:"
echo "  1. 填写 $STEERING_DIR/constitution.md — 治理原则"
echo "  2. 填写 $STEERING_DIR/product.md — 产品愿景"
echo "  3. 填写 $STEERING_DIR/ubiquitous-lang.md — 统一语言"
echo "  4. 填写 $STEERING_DIR/bounded-context.md — 限界上下文"
echo "  5. 完成后运行: spec-pm spec <feature-name>"