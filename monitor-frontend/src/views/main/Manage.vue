<script setup>
import {defineComponent, ref} from "vue";
import {get}from "@/net"
import PreviewCard from "@/component/PreviewCard.vue";

const list = ref([])

const updateList = () => get(`/api/monitor/list`, data => list.value = data)
setInterval(updateList, 10000)
updateList()
defineComponent({
  name: 'Manage'
})
</script>

<template>
  <div class="manage-main">
    <div class="title">
      <i class="fa-solid fa-server"></i>
      管理主机列表
    </div>
    <div class="desc">
      在这里管理你的主机实例
    </div>
    <el-divider style="margin: 10px 0"/>
    <div class="card-list">
      <preview-card v-for="item in list" :data="item"/>
    </div>
  </div>
</template>

<style scoped>
.manage-main {
  margin: 0 50px;

  .title {
    font-size: 22px;
    font-weight: bold;
  }

  .desc {
    font-size: 15px;
    color: grey;
  }
}

.card-list {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}
</style>