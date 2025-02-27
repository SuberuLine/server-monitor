<script setup>
import {fitByUnit, rename, percentageToStatus} from "@/tools";
import {useClipboard} from "@vueuse/core";
import {ElMessage} from "element-plus";

const props = defineProps({
  data: Object,
  update: Function
})

const {copy} = useClipboard();
const copyIp = () => {
  copy(props.data.ip).then(() => {
    ElMessage.success("成功拷贝IP地址到剪切板！")
  })
}

</script>

<template>
  <div class="instance-card">
    <div style="display: flex; justify-content: space-between">
      <div>
        <div class="name">
          <span :class="`flag-icon flag-icon-${data.location}`"></span>
          <span style="margin: 0 5px">{{data.name}}</span>
          <i style="margin: 0 5px" class="fa-solid fa-pen-to-square interact-item" @click.stop="rename(data.id, data.name, update)" />
        </div>
        <div class="os">
          操作系统：{{`${data.osName} ${data.osVersion}`}}
        </div>
      </div>
      <div class="status" v-if="data.online">
        <i style="color: #18cb18" class="fa-solid fa-circle-play"></i>
        <span style="margin: 0 5px">运行中</span>
      </div>
      <div class="status" v-else>
        <i style="color: #8a8a8a" class="fa-solid fa-circle-stop"></i>
        <span style="margin: 0 5px">离线</span>
      </div>
    </div>
    <el-divider style="margin: 10px 0" />
    <div class="network">
      <span style="margin-right: 10px">公网IP：{{data.ip}}</span>
      <i class="fa-solid fa-copy interact-item" style="color: dodgerblue" @click.stop="copyIp"></i>
    </div>
    <div class="cpu">
      <span style="margin-right: 10px">处理器： {{data.cpuName}}</span>
    </div>
    <div class="hardware">
      <div>
        <i class="fa-solid fa-microchip"></i>
        <span style="margin: 0 10px">{{data.cpuCore}} CPU</span>
        <i class="fa-solid fa-memory"></i>
        <span style="margin: 0 10px">{{data.memory.toFixed(1)}} GB</span>
      </div>
      <div class="progress">
        <span>CPU: {{(data.cpuUsage * 100).toFixed(1)}}%</span>
        <el-progress :status="percentageToStatus(data.cpuUsage * 100)" :percentage="data.cpuUsage * 100" :stroke-width="5" :show-text="false"/>
      </div>
      <div class="progress">
        <span>MEM: <b>{{data.memoryUsage.toFixed(1)}}</b> GB</span>
        <el-progress :status="percentageToStatus(data.memoryUsage / data.memory * 100)" :percentage="data.memoryUsage / data.memory * 100" :stroke-width="5" :show-text="false"/>
      </div>
      <div class="network-flow">
        <div>网络流量</div>
        <div>
          <i class="fa-solid fa-arrow-up"></i>
          <span>{{fitByUnit(data.networkUpload, 'KB')}}/s</span>
          <el-divider direction="vertical"/>
          <i class="fa-solid fa-arrow-down"></i>
          <span>{{fitByUnit(data.networkDownload, 'KB')}}/s</span>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dark .instance-card {color: #d9d9d9}

.interact-item {
  transition: .3s;

  &:hover {
    cursor: pointer;
    scale: 1.1;
    opacity: 0.8;
  }
}

.instance-card {
  width: 320px;
  padding: 15px;
  background-color: var(--el-bg-color);
  border-radius: 5px;
  box-sizing: border-box;
  color: #6b6b6b;

  &:hover {
    cursor: pointer;
    scale: 1.02;
  }

  .name {
    font-size: 15px;
    font-weight: bold;
  }

  .status {
    font-size: 14px;
  }

  .os {
    font-size: 13px;
    color: grey;
  }

  .network {
    font-size: 13px;
  }

  .cpu {
    font-size: 13px;
  }

  .hardware {
    margin-top: 5px;
    font-size: 13px;
  }

  .progress {
    margin-top: 10px;
    font-size: 12px;
  }

  .cpu {
    font-size: 13px;
  }

  .network-flow {
    margin-top: 10px;
    font-size: 12px;
    display: flex;
    justify-content: space-between;
  }
}
</style>